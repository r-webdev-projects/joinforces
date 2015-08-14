class User < ActiveRecord::Base
  has_many :ideas

  validates :username, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         # :confirmable, :lockable, :timeoutable and :omniauthable

  cattr_accessor :current_user

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

  def gravatar_url
    gravatar_id = Digest::MD5::hexdigest(self.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end
end
