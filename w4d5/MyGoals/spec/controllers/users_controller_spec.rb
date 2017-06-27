require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "renders the new users page" do
      get :new, user: {}
      expect(response).to render_template("new")
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of name and password" do
        post :create, user: {name: "this is an invalid link"}
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid params" do
      post :create, user: {name: "Zach", password: "password"}
      user.valid?

      it "logs in the user" do
        expect(session[:session_token]).to eq(user.session_token)
      end

      it "redirects to the user show page" do
        expect(response).to redirect_to(user_url(User.last))
      end
    end

  end

end
