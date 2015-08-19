class User < ActiveRecord::Base
  has_many :ideas
  has_many :comments, dependent: :destroy

  validates :username, :presence => true,
                       :uniqueness => { :case_sensitive => false }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:github, :twitter, :google_oauth2]
         # :confirmable, :lockable, :timeoutable

  cattr_accessor :current_user

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  acts_as_voter

  extend FriendlyId
  friendly_id :username, use: [:slugged, :finders]

  def full_name
    name = ""
    if self.first_name.present?
      name << self.first_name
    end
    if self.last_name.present?
      name << " " << self.last_name
    end
    name
  end

  def gravatar_url(size = '48')
    gravatar_id = Digest::MD5::hexdigest(self.email).downcase
    "//gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_hash).first
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.username = auth.info.nickname
      user.password = Devise.friendly_token[0,20]
      # user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      # if data = session["devise.twitter_data"] && session["devise.twitter_data"]
      #   user.email = data['info']['email'] if user.email.blank?
      #   user.username = data['info']['nickname'] if user.username.blank?
      # end
    end
  end
end
