class Idea < ActiveRecord::Base

  belongs_to :user
  acts_as_commontable

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

end
