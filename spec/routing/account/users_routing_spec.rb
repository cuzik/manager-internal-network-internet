require "rails_helper"

RSpec.describe Account::UsersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/account/users").to route_to("account/users#index")
    end

    it "routes to #new" do
      expect(:get => "/account/users/new").to route_to("account/users#new")
    end

    it "routes to #show" do
      expect(:get => "/account/users/1").to route_to("account/users#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/account/users/1/edit").to route_to("account/users#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/account/users").to route_to("account/users#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/account/users/1").to route_to("account/users#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/account/users/1").to route_to("account/users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/account/users/1").to route_to("account/users#destroy", :id => "1")
    end
  end
end
