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

  def redeem reward
    error = nil
    if reward
      if self.points >= reward.points
        coupon = Coupon.create(user: self, reward: reward, expires_at: (DateTime.now + 1.month), points: reward.points)
        unless coupon.valid?
          error = coupon.errors.full_messages
        end
      else
        error = "You don't have enouph points to redeem this coupon"
      end
    else
      error = "Reward can't be nil"
    end
    error
  end
end
