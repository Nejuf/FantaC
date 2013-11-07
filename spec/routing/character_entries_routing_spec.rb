require "spec_helper"

describe CharacterEntriesController do
  describe "routing" do

    it "routes to #index" do
      get("/character_entries").should route_to("character_entries#index")
    end

    it "routes to #new" do
      get("/character_entries/new").should route_to("character_entries#new")
    end

    it "routes to #show" do
      get("/character_entries/1").should route_to("character_entries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/character_entries/1/edit").should route_to("character_entries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/character_entries").should route_to("character_entries#create")
    end

    it "routes to #update" do
      put("/character_entries/1").should route_to("character_entries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/character_entries/1").should route_to("character_entries#destroy", :id => "1")
    end

  end
end
