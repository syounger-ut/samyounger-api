class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :full_name, :email

  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end
