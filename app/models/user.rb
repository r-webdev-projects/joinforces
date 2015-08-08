class User < ActiveRecord::Base

  has_many :ideas
  has_many :comments, foreign_key: :author_id

  validates :first_name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         # :confirmable, :lockable, :timeoutable and :omniauthable

  cattr_accessor :current_user

end
