require "rails_helper"

RSpec.describe PortsController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(:get => "/ports/new").to route_to("ports#new")
    end

    it "routes to #show" do
      expect(:get => "/ports/1").to route_to("ports#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/ports/1/edit").to route_to("ports#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/ports").to route_to("ports#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/ports/1").to route_to("ports#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/ports/1").to route_to("ports#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ports/1").to route_to("ports#destroy", :id => "1")
    end
  end
end
