class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :first_name, :last_name,
             :full_name, :email, :avatar_url

  def avatar_url
    return unless object.avatar.attached?

    rails_blob_path(object.avatar, only_path: true)
  end

  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end
