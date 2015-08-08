class Comment < ActiveRecord::Base

  belongs_to :idea
  belongs_to :user

  before_create :assign_to_user

  private
  def assign_to_user
    self.user = User.current_user
  end

end
