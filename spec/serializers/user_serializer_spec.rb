require 'rails_helper'

describe UserSerializer do
  let!(:user) { create(:user, :with_avatar) }

  subject { described_class.new(user) }

  describe "#avatar_url" do
    include Rails.application.routes.url_helpers

    it "returns the avatar_url" do
      expect(
        subject.serializable_hash[:avatar_url]
      ).to eq rails_blob_path(user.avatar, only_path: true)
    end

    context "the user doesn't have an avatar" do
      it "doesn't raise an error" do
        expect {
          expect(subject.avatar_url)
        }.not_to raise_error
      end
    end
  end

  describe "#full_name" do
    it "returns the first and last name combined" do
      expect(subject.serializable_hash[:full_name]).to eq "#{user.first_name} #{user.last_name}"
    end
  end
end
