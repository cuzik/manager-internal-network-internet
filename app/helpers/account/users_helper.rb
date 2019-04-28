module Account::UsersHelper
  def class_color_user(user)
    return "bg-secondary" if user.id == current_user.id

    "bg-light"
  end
end
