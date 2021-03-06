require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe BattleRostersController do

  # This should return the minimal set of attributes required to create a valid
  # BattleRoster. As you add validations to BattleRoster, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BattleRostersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all battle_rosters as @battle_rosters" do
      battle_roster = BattleRoster.create! valid_attributes
      get :index, {}, valid_session
      assigns(:battle_rosters).should eq([battle_roster])
    end
  end

  describe "GET show" do
    it "assigns the requested battle_roster as @battle_roster" do
      battle_roster = BattleRoster.create! valid_attributes
      get :show, {:id => battle_roster.to_param}, valid_session
      assigns(:battle_roster).should eq(battle_roster)
    end
  end

  describe "GET new" do
    it "assigns a new battle_roster as @battle_roster" do
      get :new, {}, valid_session
      assigns(:battle_roster).should be_a_new(BattleRoster)
    end
  end

  describe "GET edit" do
    it "assigns the requested battle_roster as @battle_roster" do
      battle_roster = BattleRoster.create! valid_attributes
      get :edit, {:id => battle_roster.to_param}, valid_session
      assigns(:battle_roster).should eq(battle_roster)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new BattleRoster" do
        expect {
          post :create, {:battle_roster => valid_attributes}, valid_session
        }.to change(BattleRoster, :count).by(1)
      end

      it "assigns a newly created battle_roster as @battle_roster" do
        post :create, {:battle_roster => valid_attributes}, valid_session
        assigns(:battle_roster).should be_a(BattleRoster)
        assigns(:battle_roster).should be_persisted
      end

      it "redirects to the created battle_roster" do
        post :create, {:battle_roster => valid_attributes}, valid_session
        response.should redirect_to(BattleRoster.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved battle_roster as @battle_roster" do
        # Trigger the behavior that occurs when invalid params are submitted
        BattleRoster.any_instance.stub(:save).and_return(false)
        post :create, {:battle_roster => {  }}, valid_session
        assigns(:battle_roster).should be_a_new(BattleRoster)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        BattleRoster.any_instance.stub(:save).and_return(false)
        post :create, {:battle_roster => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested battle_roster" do
        battle_roster = BattleRoster.create! valid_attributes
        # Assuming there are no other battle_rosters in the database, this
        # specifies that the BattleRoster created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        BattleRoster.any_instance.should_receive(:update).with({ "these" => "params" })
        put :update, {:id => battle_roster.to_param, :battle_roster => { "these" => "params" }}, valid_session
      end

      it "assigns the requested battle_roster as @battle_roster" do
        battle_roster = BattleRoster.create! valid_attributes
        put :update, {:id => battle_roster.to_param, :battle_roster => valid_attributes}, valid_session
        assigns(:battle_roster).should eq(battle_roster)
      end

      it "redirects to the battle_roster" do
        battle_roster = BattleRoster.create! valid_attributes
        put :update, {:id => battle_roster.to_param, :battle_roster => valid_attributes}, valid_session
        response.should redirect_to(battle_roster)
      end
    end

    describe "with invalid params" do
      it "assigns the battle_roster as @battle_roster" do
        battle_roster = BattleRoster.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BattleRoster.any_instance.stub(:save).and_return(false)
        put :update, {:id => battle_roster.to_param, :battle_roster => {  }}, valid_session
        assigns(:battle_roster).should eq(battle_roster)
      end

      it "re-renders the 'edit' template" do
        battle_roster = BattleRoster.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BattleRoster.any_instance.stub(:save).and_return(false)
        put :update, {:id => battle_roster.to_param, :battle_roster => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested battle_roster" do
      battle_roster = BattleRoster.create! valid_attributes
      expect {
        delete :destroy, {:id => battle_roster.to_param}, valid_session
      }.to change(BattleRoster, :count).by(-1)
    end

    it "redirects to the battle_rosters list" do
      battle_roster = BattleRoster.create! valid_attributes
      delete :destroy, {:id => battle_roster.to_param}, valid_session
      response.should redirect_to(battle_rosters_url)
    end
  end

end
