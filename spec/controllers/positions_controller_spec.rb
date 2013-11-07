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

describe PositionsController do

  # This should return the minimal set of attributes required to create a valid
  # Position. As you add validations to Position, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PositionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all positions as @positions" do
      position = Position.create! valid_attributes
      get :index, {}, valid_session
      assigns(:positions).should eq([position])
    end
  end

  describe "GET show" do
    it "assigns the requested position as @position" do
      position = Position.create! valid_attributes
      get :show, {:id => position.to_param}, valid_session
      assigns(:position).should eq(position)
    end
  end

  describe "GET new" do
    it "assigns a new position as @position" do
      get :new, {}, valid_session
      assigns(:position).should be_a_new(Position)
    end
  end

  describe "GET edit" do
    it "assigns the requested position as @position" do
      position = Position.create! valid_attributes
      get :edit, {:id => position.to_param}, valid_session
      assigns(:position).should eq(position)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Position" do
        expect {
          post :create, {:position => valid_attributes}, valid_session
        }.to change(Position, :count).by(1)
      end

      it "assigns a newly created position as @position" do
        post :create, {:position => valid_attributes}, valid_session
        assigns(:position).should be_a(Position)
        assigns(:position).should be_persisted
      end

      it "redirects to the created position" do
        post :create, {:position => valid_attributes}, valid_session
        response.should redirect_to(Position.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved position as @position" do
        # Trigger the behavior that occurs when invalid params are submitted
        Position.any_instance.stub(:save).and_return(false)
        post :create, {:position => {  }}, valid_session
        assigns(:position).should be_a_new(Position)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Position.any_instance.stub(:save).and_return(false)
        post :create, {:position => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested position" do
        position = Position.create! valid_attributes
        # Assuming there are no other positions in the database, this
        # specifies that the Position created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Position.any_instance.should_receive(:update).with({ "these" => "params" })
        put :update, {:id => position.to_param, :position => { "these" => "params" }}, valid_session
      end

      it "assigns the requested position as @position" do
        position = Position.create! valid_attributes
        put :update, {:id => position.to_param, :position => valid_attributes}, valid_session
        assigns(:position).should eq(position)
      end

      it "redirects to the position" do
        position = Position.create! valid_attributes
        put :update, {:id => position.to_param, :position => valid_attributes}, valid_session
        response.should redirect_to(position)
      end
    end

    describe "with invalid params" do
      it "assigns the position as @position" do
        position = Position.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Position.any_instance.stub(:save).and_return(false)
        put :update, {:id => position.to_param, :position => {  }}, valid_session
        assigns(:position).should eq(position)
      end

      it "re-renders the 'edit' template" do
        position = Position.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Position.any_instance.stub(:save).and_return(false)
        put :update, {:id => position.to_param, :position => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested position" do
      position = Position.create! valid_attributes
      expect {
        delete :destroy, {:id => position.to_param}, valid_session
      }.to change(Position, :count).by(-1)
    end

    it "redirects to the positions list" do
      position = Position.create! valid_attributes
      delete :destroy, {:id => position.to_param}, valid_session
      response.should redirect_to(positions_url)
    end
  end

end
