require 'rails_helper'

describe AuthenticationsController, type: :controller do
	describe '#register' do
		let(:params) do
			{
				first_name: "Foo",
				last_name: "Bar",
				email: "foo.bar@foobar.com",
				password: "password",
				password_confirmation: "password"
			}
		end

		it 'creates a new user' do
			expect {
				post :register, params: params
			}.to change(User, :count)
		end
	end

	describe "#login" do
		let!(:user) { create :user }

		let(:params) do
			{
				email: user.email,
				password: user.password
			}
		end

		it "returns status 200" do
			post :login, params: params
			expect(response).to have_http_status :ok
		end

		describe "incorrect credentials" do
			context "password" do
				before :example do
					params[:password] = "foobar"
				end

				it "returns unauthorized" do
					post :login, params: params
					expect(response).to have_http_status :unauthorized
				end
			end

			context "email" do
				before :example do
					params[:email] = "foobar"
				end

				it "returns unauthorized status" do
					post :login, params: params
					expect(response).to have_http_status :unauthorized
				end
			end
		end
	end
end
