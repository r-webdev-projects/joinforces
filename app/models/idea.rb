class Idea < ActiveRecord::Base

  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  acts_as_votable

end
