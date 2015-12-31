class Idea < ActiveRecord::Base

  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  acts_as_votable

   # This method associates the attribute ":image" with a file attachment
  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
