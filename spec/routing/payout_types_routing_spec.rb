require "spec_helper"

describe PayoutTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/payout_types").should route_to("payout_types#index")
    end

    it "routes to #new" do
      get("/payout_types/new").should route_to("payout_types#new")
    end

    it "routes to #show" do
      get("/payout_types/1").should route_to("payout_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/payout_types/1/edit").should route_to("payout_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/payout_types").should route_to("payout_types#create")
    end

    it "routes to #update" do
      put("/payout_types/1").should route_to("payout_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/payout_types/1").should route_to("payout_types#destroy", :id => "1")
    end

  end
end
