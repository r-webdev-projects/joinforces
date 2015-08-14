module IdeasHelper

  def idea_by_current_user?(comment)
    if current_user.id == comment.user.try(:id)
      return true
    else
      return false
    end
  end
end
