class User < ActiveRecord::Base

  has_many :ideas

  validates :first_name, presence: true

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

end
