class User < ActiveRecord::Base
  has_many :ideas
  has_many :comments, dependent: :destroy

  validates :username, :presence => true,
                       :uniqueness => { :case_sensitive => false }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         # :confirmable, :lockable, :timeoutable and :omniauthable

  cattr_accessor :current_user

  # For skills tags
  acts_as_taggable # basic usage - gives us 'tags'
  acts_as_taggable_on :skills

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
end
