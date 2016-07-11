require 'rails_helper'

RSpec.describe "Users", :type => :request do
  describe "GET /users" do
    it "works! (now write some real specs)" do
      get users_path
      expect(response).to have_http_status(200)
    end

    it "returns all users" do
      FactoryGirl.create :user, name: 'Steve Jobs', email: 'steve@apple.com', password:'apple12'
      FactoryGirl.create :user, name: 'Bill Gates', email: 'bill@apple.com', password:'apple12'

      get '/users'
      expect(response.status).to eq 200
      body = JSON.parse(response.body)
      user_names = body.map{|user| user['name']}
      expect(user_names).to match_array(['Steve Jobs', 'Bill Gates'])
    end
  end

  describe "GET /users/:id" do
    it "returns the specified user" do
      FactoryGirl.create :user, name: 'Steve Jobs', email: 'steve@apple.com', password:'apple12', id:1

      get '/users/1'

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      user_name = body['name']
      expect(user_name) == 'Steve Jobs'
    end
  end

  #Users are created with email and password at /auth by DeviseTokenAuth::RegistrationsController
  describe "POST /users" do
    it "cannot create the specified user" do
      user = {
        name: "Steve Jobs",
        email: "steve@apple.com",
        password: "apple12"
      }

      post '/users',
        params: user.to_json,
        headers: { 'Content-Type': 'application/json' }

      expect(response.status).to eq 422
    end
  end

  describe "PUT /user/:id" do
    it "updates the specified user" do
      FactoryGirl.create :user, name: 'Steve Jobs', email: 'steve@apple.com', password:'apple12', id:1

      user = {
        id: 1,
        name: 'Steve Jobs1'
      }

      put '/users/1',
        params: user.to_json,
        headers: { 'Content-Type': 'application/json' }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      user_name = body['name']
      expect(user_name) == 'Steve Jobs1'
    end
  end

  describe "DELETE /users/:id" do
    it "deletes the specified user" do
      FactoryGirl.create :user, name: 'Steve Jobs', email: 'steve@apple.com', password:'apple12', id:1

      delete '/users/1'

      expect(response.status).to eq 204
    end
  end
end
