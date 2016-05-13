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
        error = I18n.t("user_redeem_errors.not_enough_points")
      end
    else
      error = I18n.t("user_redeem_errors.nil_reward")
    end
    error
  end

  def image_url
    img_url = read_attribute(:image_url)
    img_url.present? ? img_url : "https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/w200-h200/photo.jpg"
  end
end
