require "spec_helper"

describe BattleRostersController do
  describe "routing" do

    it "routes to #index" do
      get("/battle_rosters").should route_to("battle_rosters#index")
    end

    it "routes to #new" do
      get("/battle_rosters/new").should route_to("battle_rosters#new")
    end

    it "routes to #show" do
      get("/battle_rosters/1").should route_to("battle_rosters#show", :id => "1")
    end

    it "routes to #edit" do
      get("/battle_rosters/1/edit").should route_to("battle_rosters#edit", :id => "1")
    end

    it "routes to #create" do
      post("/battle_rosters").should route_to("battle_rosters#create")
    end

    it "routes to #update" do
      put("/battle_rosters/1").should route_to("battle_rosters#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/battle_rosters/1").should route_to("battle_rosters#destroy", :id => "1")
    end

  end
end
