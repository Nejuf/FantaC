require "spec_helper"

describe AffinitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/affinities").should route_to("affinities#index")
    end

    it "routes to #new" do
      get("/affinities/new").should route_to("affinities#new")
    end

    it "routes to #show" do
      get("/affinities/1").should route_to("affinities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/affinities/1/edit").should route_to("affinities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/affinities").should route_to("affinities#create")
    end

    it "routes to #update" do
      put("/affinities/1").should route_to("affinities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/affinities/1").should route_to("affinities#destroy", :id => "1")
    end

  end
end
