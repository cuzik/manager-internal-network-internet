require "rails_helper"

RSpec.describe ComputersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/computers").to route_to("computers#index")
    end

    it "routes to #new" do
      expect(:get => "/computers/new").to route_to("computers#new")
    end

    it "routes to #show" do
      expect(:get => "/computers/1").to route_to("computers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/computers/1/edit").to route_to("computers#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/computers").to route_to("computers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/computers/1").to route_to("computers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/computers/1").to route_to("computers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/computers/1").to route_to("computers#destroy", :id => "1")
    end
  end
end
