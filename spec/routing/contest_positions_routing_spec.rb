require "spec_helper"

describe ContestPositionsController do
  describe "routing" do

    it "routes to #index" do
      get("/contest_positions").should route_to("contest_positions#index")
    end

    it "routes to #new" do
      get("/contest_positions/new").should route_to("contest_positions#new")
    end

    it "routes to #show" do
      get("/contest_positions/1").should route_to("contest_positions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/contest_positions/1/edit").should route_to("contest_positions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/contest_positions").should route_to("contest_positions#create")
    end

    it "routes to #update" do
      put("/contest_positions/1").should route_to("contest_positions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/contest_positions/1").should route_to("contest_positions#destroy", :id => "1")
    end

  end
end
