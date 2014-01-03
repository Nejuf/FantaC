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

describe CharactersController do

  login_user

  # This should return the minimal set of attributes required to create a valid
  # Character. As you add validations to Character, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do 
    char = FactoryGirl.attributes_for(:character) 
    char.delete :user_id
    char.each do |k,v|
      char[k] = v.to_s
    end
    char.stringify_keys
  end
  let(:new_attributes) do 
    char = FactoryGirl.attributes_for(:character) 
    char.delete :user_id
    char.each do |k,v|
      char[k] = v.to_s
    end
    char.stringify_keys
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CharactersController. Be sure to keep this updated too.
  let(:valid_session) { session }

  describe "GET index" do
    it "assigns all characters as @characters" do
      character = Character.create! valid_attributes
      get :index, {}, valid_session
      assigns(:characters).should eq([character])
    end
  end

  describe "GET show" do
    it "assigns the requested character as @character" do
      character = Character.create! valid_attributes
      get :show, {:id => character.to_param}, valid_session
      assigns(:character).should eq(character)
    end
  end

  describe "GET new" do
    it "assigns a new character as @character" do
      get :new, {}, valid_session
      assigns(:character).should be_a_new(Character)
    end
  end

  describe "GET edit" do
    it "assigns the requested character as @character" do
      character = Character.create! valid_attributes
      get :edit, {:id => character.to_param}, valid_session
      assigns(:character).should eq(character)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Character" do
        expect {
          post :create, {:character => valid_attributes}, valid_session
        }.to change(Character, :count).by(1)
      end

      it "assigns a newly created character as @character" do
        post :create, {:character => valid_attributes}, valid_session
        assigns(:character).should be_a(Character)
        assigns(:character).should be_persisted
      end

      it "redirects to the created character" do
        post :create, {:character => valid_attributes}, valid_session
        response.should redirect_to(Character.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved character as @character" do
        # Trigger the behavior that occurs when invalid params are submitted
        Character.any_instance.stub(:save).and_return(false)
        post :create, {:character => {  }}, valid_session
        assigns(:character).should be_a_new(Character)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Character.any_instance.stub(:save).and_return(false)
        post :create, {:character => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested character" do
        character = Character.create! valid_attributes
        # Assuming there are no other characters in the database, this
        # specifies that the Character created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Character.any_instance.should_receive(:update).with(new_attributes)
        put :update, {:id => character.to_param, :character => new_attributes}, valid_session
      end

      it "assigns the requested character as @character" do
        character = Character.create! valid_attributes
        put :update, {:id => character.to_param, :character => valid_attributes}, valid_session
        assigns(:character).should eq(character)
      end

      it "redirects to the character" do
        character = Character.create! valid_attributes
        put :update, {:id => character.to_param, :character => valid_attributes}, valid_session
        response.should redirect_to(character)
      end
    end

    describe "with invalid params" do
      it "assigns the character as @character" do
        character = Character.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Character.any_instance.stub(:save).and_return(false)
        put :update, {:id => character.to_param, :character => {  }}, valid_session
        assigns(:character).should eq(character)
      end

      it "re-renders the 'edit' template" do
        character = Character.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Character.any_instance.stub(:save).and_return(false)
        put :update, {:id => character.to_param, :character => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested character" do
      character = Character.create! valid_attributes
      expect {
        delete :destroy, {:id => character.to_param}, valid_session
      }.to change(Character, :count).by(-1)
    end

    it "redirects to the characters list" do
      character = Character.create! valid_attributes
      delete :destroy, {:id => character.to_param}, valid_session
      response.should redirect_to(characters_url)
    end
  end

end
