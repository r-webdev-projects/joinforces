class Idea < ActiveRecord::Base

  has_many :comments, dependent: :destroy
  belongs_to :user

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

end
