module ApplicationHelper
  def user_initials(user)
    "#{user.firstname[0]}#{user.lastname[0]}".upcase
  end
end
