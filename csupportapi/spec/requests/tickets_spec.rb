require 'rails_helper'

RSpec.describe "Tickets", :type => :request do
  describe "GET /tickets" do
    it "works! (now write some real specs)" do
      get tickets_path
      expect(response).to have_http_status(200)
    end
  end
end

RSpec.describe "Tickets", :type => :request do
  describe "GET /tickets" do
    it "has http status 200" do
      get tickets_path
      expect(response).to have_http_status(200)
    end

    it "returns all tickets" do
      FactoryGirl.create :ticket, name: 'Ticket1', user_id:1, description: 'MyTicket', status:1
      FactoryGirl.create :ticket, name: 'Ticket2', user_id:1, description: 'MyTicket', status:1

      get '/tickets'
      expect(response.status).to eq 200
      body = JSON.parse(response.body)
      ticket_names = body.map{|ticket| ticket['name']}
      expect(ticket_names).to match_array(['Ticket1', 'Ticket2'])
    end
  end

  describe "GET /tickets/:id" do
    it "returns the specified ticket" do
      FactoryGirl.create :ticket, name: 'Ticket1', user_id:1, description: 'MyTicket', status:1, id:1

      get '/tickets/1'

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      ticket_name = body['name']
      expect(ticket_name) == 'Ticket1'
    end
  end

  describe "POST /tickets" do
    it "creates the specified ticket" do
      ticket = {
        name: "Ticket1",
        user_id: 1,
        description: "MyTicket",
        status:0
      }

      post '/tickets',
        params: ticket.to_json,
        headers: { 'Content-Type': 'application/json' }

      expect(response.status).to eq 201
    end
  end

  describe "PUT /tickets/:id" do
    it "updates the specified ticket" do
      FactoryGirl.create :ticket, name: 'Ticket1', user_id:1, description: 'MyTicket', status:1, id:1

      ticket = {
        id: 1,
        name: 'Ticket2'
      }

      put '/tickets/1',
        params: ticket.to_json,
        headers: { 'Content-Type': 'application/json' }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      ticket_name = body['name']
      expect(ticket_name) == 'Ticket2'
    end
  end

  describe "DELETE /ticket/:id" do
    it "deletes the specified ticket" do
      FactoryGirl.create :ticket, name: 'Ticket1', user_id:1, description: 'MyTicket', status:1, id:1

      delete '/tickets/1'

      expect(response.status).to eq 204
    end
  end
end

