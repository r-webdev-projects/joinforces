class Idea < ActiveRecord::Base

  belongs_to :user

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

end
