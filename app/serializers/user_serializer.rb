class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :full_name, :email, :avatar_url

  def avatar_url
    instance_options[:avatar_url]
  end

  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end
