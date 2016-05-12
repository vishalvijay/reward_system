class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  AUTH_PROVIDER = [:facebook, :google_oauth2]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: AUTH_PROVIDER
  validates_presence_of :name

  has_many :reward_point_transactions, -> { order 'created_at desc' }
  has_many :coupons, -> { order 'created_at desc' }

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.image_url = auth.info.image
    end
  end

  def points
    reward_point_transactions.sum :points
  end

  def as_json(options = { })
    super({methods: [:points]}.merge(options))
  end
end
