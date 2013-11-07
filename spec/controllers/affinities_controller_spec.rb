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

describe AffinitiesController do

  # This should return the minimal set of attributes required to create a valid
  # Affinity. As you add validations to Affinity, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AffinitiesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all affinities as @affinities" do
      affinity = Affinity.create! valid_attributes
      get :index, {}, valid_session
      assigns(:affinities).should eq([affinity])
    end
  end

  describe "GET show" do
    it "assigns the requested affinity as @affinity" do
      affinity = Affinity.create! valid_attributes
      get :show, {:id => affinity.to_param}, valid_session
      assigns(:affinity).should eq(affinity)
    end
  end

  describe "GET new" do
    it "assigns a new affinity as @affinity" do
      get :new, {}, valid_session
      assigns(:affinity).should be_a_new(Affinity)
    end
  end

  describe "GET edit" do
    it "assigns the requested affinity as @affinity" do
      affinity = Affinity.create! valid_attributes
      get :edit, {:id => affinity.to_param}, valid_session
      assigns(:affinity).should eq(affinity)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Affinity" do
        expect {
          post :create, {:affinity => valid_attributes}, valid_session
        }.to change(Affinity, :count).by(1)
      end

      it "assigns a newly created affinity as @affinity" do
        post :create, {:affinity => valid_attributes}, valid_session
        assigns(:affinity).should be_a(Affinity)
        assigns(:affinity).should be_persisted
      end

      it "redirects to the created affinity" do
        post :create, {:affinity => valid_attributes}, valid_session
        response.should redirect_to(Affinity.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved affinity as @affinity" do
        # Trigger the behavior that occurs when invalid params are submitted
        Affinity.any_instance.stub(:save).and_return(false)
        post :create, {:affinity => {  }}, valid_session
        assigns(:affinity).should be_a_new(Affinity)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Affinity.any_instance.stub(:save).and_return(false)
        post :create, {:affinity => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested affinity" do
        affinity = Affinity.create! valid_attributes
        # Assuming there are no other affinities in the database, this
        # specifies that the Affinity created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Affinity.any_instance.should_receive(:update).with({ "these" => "params" })
        put :update, {:id => affinity.to_param, :affinity => { "these" => "params" }}, valid_session
      end

      it "assigns the requested affinity as @affinity" do
        affinity = Affinity.create! valid_attributes
        put :update, {:id => affinity.to_param, :affinity => valid_attributes}, valid_session
        assigns(:affinity).should eq(affinity)
      end

      it "redirects to the affinity" do
        affinity = Affinity.create! valid_attributes
        put :update, {:id => affinity.to_param, :affinity => valid_attributes}, valid_session
        response.should redirect_to(affinity)
      end
    end

    describe "with invalid params" do
      it "assigns the affinity as @affinity" do
        affinity = Affinity.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Affinity.any_instance.stub(:save).and_return(false)
        put :update, {:id => affinity.to_param, :affinity => {  }}, valid_session
        assigns(:affinity).should eq(affinity)
      end

      it "re-renders the 'edit' template" do
        affinity = Affinity.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Affinity.any_instance.stub(:save).and_return(false)
        put :update, {:id => affinity.to_param, :affinity => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested affinity" do
      affinity = Affinity.create! valid_attributes
      expect {
        delete :destroy, {:id => affinity.to_param}, valid_session
      }.to change(Affinity, :count).by(-1)
    end

    it "redirects to the affinities list" do
      affinity = Affinity.create! valid_attributes
      delete :destroy, {:id => affinity.to_param}, valid_session
      response.should redirect_to(affinities_url)
    end
  end

end