module CommentsHelper

  def comment_by_current_user?(comment)
    if user_signed_in? && current_user.id == comment.user.try(:id)
      return true
    else
      return false
    end
  end

end
