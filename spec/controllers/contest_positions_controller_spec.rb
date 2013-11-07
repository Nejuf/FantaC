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

describe ContestPositionsController do

  # This should return the minimal set of attributes required to create a valid
  # ContestPosition. As you add validations to ContestPosition, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ContestPositionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all contest_positions as @contest_positions" do
      contest_position = ContestPosition.create! valid_attributes
      get :index, {}, valid_session
      assigns(:contest_positions).should eq([contest_position])
    end
  end

  describe "GET show" do
    it "assigns the requested contest_position as @contest_position" do
      contest_position = ContestPosition.create! valid_attributes
      get :show, {:id => contest_position.to_param}, valid_session
      assigns(:contest_position).should eq(contest_position)
    end
  end

  describe "GET new" do
    it "assigns a new contest_position as @contest_position" do
      get :new, {}, valid_session
      assigns(:contest_position).should be_a_new(ContestPosition)
    end
  end

  describe "GET edit" do
    it "assigns the requested contest_position as @contest_position" do
      contest_position = ContestPosition.create! valid_attributes
      get :edit, {:id => contest_position.to_param}, valid_session
      assigns(:contest_position).should eq(contest_position)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ContestPosition" do
        expect {
          post :create, {:contest_position => valid_attributes}, valid_session
        }.to change(ContestPosition, :count).by(1)
      end

      it "assigns a newly created contest_position as @contest_position" do
        post :create, {:contest_position => valid_attributes}, valid_session
        assigns(:contest_position).should be_a(ContestPosition)
        assigns(:contest_position).should be_persisted
      end

      it "redirects to the created contest_position" do
        post :create, {:contest_position => valid_attributes}, valid_session
        response.should redirect_to(ContestPosition.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved contest_position as @contest_position" do
        # Trigger the behavior that occurs when invalid params are submitted
        ContestPosition.any_instance.stub(:save).and_return(false)
        post :create, {:contest_position => {  }}, valid_session
        assigns(:contest_position).should be_a_new(ContestPosition)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ContestPosition.any_instance.stub(:save).and_return(false)
        post :create, {:contest_position => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested contest_position" do
        contest_position = ContestPosition.create! valid_attributes
        # Assuming there are no other contest_positions in the database, this
        # specifies that the ContestPosition created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ContestPosition.any_instance.should_receive(:update).with({ "these" => "params" })
        put :update, {:id => contest_position.to_param, :contest_position => { "these" => "params" }}, valid_session
      end

      it "assigns the requested contest_position as @contest_position" do
        contest_position = ContestPosition.create! valid_attributes
        put :update, {:id => contest_position.to_param, :contest_position => valid_attributes}, valid_session
        assigns(:contest_position).should eq(contest_position)
      end

      it "redirects to the contest_position" do
        contest_position = ContestPosition.create! valid_attributes
        put :update, {:id => contest_position.to_param, :contest_position => valid_attributes}, valid_session
        response.should redirect_to(contest_position)
      end
    end

    describe "with invalid params" do
      it "assigns the contest_position as @contest_position" do
        contest_position = ContestPosition.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ContestPosition.any_instance.stub(:save).and_return(false)
        put :update, {:id => contest_position.to_param, :contest_position => {  }}, valid_session
        assigns(:contest_position).should eq(contest_position)
      end

      it "re-renders the 'edit' template" do
        contest_position = ContestPosition.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ContestPosition.any_instance.stub(:save).and_return(false)
        put :update, {:id => contest_position.to_param, :contest_position => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested contest_position" do
      contest_position = ContestPosition.create! valid_attributes
      expect {
        delete :destroy, {:id => contest_position.to_param}, valid_session
      }.to change(ContestPosition, :count).by(-1)
    end

    it "redirects to the contest_positions list" do
      contest_position = ContestPosition.create! valid_attributes
      delete :destroy, {:id => contest_position.to_param}, valid_session
      response.should redirect_to(contest_positions_url)
    end
  end

end
