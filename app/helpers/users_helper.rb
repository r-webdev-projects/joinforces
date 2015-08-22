module UsersHelper

  def total_users(label = '')
    total_users = User.all.count.to_s
    if label.present?
      total_users << " " << label.pluralize(User.all.count)
    else
      total_users
    end
  end
end
