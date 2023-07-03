require "rails_helper"

module Users
  RSpec.describe UsersController, type: :controller do
    describe "GET show" do
      it "returns a 200" do
        get "/users/1"
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
