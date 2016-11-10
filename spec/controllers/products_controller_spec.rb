require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  let(:user) {FactoryGirl.create(:user)}
  # This should return the minimal set of attributes required to create a valid
  # Product. As you add validations to Product, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { name: 'Eggs', estimated_cost: '7.99' }
  }

  let(:invalid_attributes) {
    { name: '' }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProductsController. Be sure to keep this updated too.
  let(:valid_session) { {} }
  
  before do
    sign_in user
    @product = user.products.create! valid_attributes
    #user.products << @product
    @products = user.products
  end

  describe "GET #index" do
    it "assigns all products as @products" do
      
      get :index, params: {}
      expect(assigns(:products)).to match_array(@products)
    end
  end

  describe "GET #show" do
    it "assigns the requested product as @product" do
      get :show, params: {id: @product.to_param}
      expect(assigns(:product)).to eq(@product)
    end
  end

  describe "GET #new" do
    it "assigns a new product as @product" do
      get :new, params: {}
      expect(assigns(:product)).to be_a_new(Product)
    end
  end

  describe "GET #edit" do
    it "assigns the requested product as @product" do
      get :edit, params: {id: @product.to_param}
      expect(assigns(:product)).to eq(@product)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Product" do
        expect {
          post :create, params: {product: valid_attributes}
        }.to change(Product, :count).by(1)
      end

      it "assigns a newly created product as @product" do
        post :create, params: {product: valid_attributes}
        expect(assigns(:product)).to be_a(Product)
        expect(assigns(:product)).to be_persisted
      end

      it "redirects to the product listing" do
        post :create, params: {product: valid_attributes}
        expect(response).to redirect_to(products_path)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved product as @product" do
        post :create, params: {product: invalid_attributes}, session: valid_session
        expect(assigns(:product)).to be_a_new(Product)
      end

      it "re-renders the 'new' template" do
        post :create, params: {product: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: 'Milk', estimated_cost: '3.99' }
      }

      it "updates the requested product" do
        put :update, params: {id: @product.to_param, product: new_attributes}, session: valid_session
        @product.reload
        expect(@product.name).to eq 'Milk'
        expect(@product.estimated_cost).to eq 3.99
      end

      it "assigns the requested product as @product" do
        put :update, params: {id: @product.to_param, product: valid_attributes}, session: valid_session
        expect(assigns(:product)).to eq(@product)
      end

      it "redirects to the product" do
        put :update, params: {id: @product.to_param, product: valid_attributes}, session: valid_session
        expect(response).to redirect_to(@product)
      end
    end

    context "with invalid params" do
      it "assigns the product as @product" do
        put :update, params: {id: @product.to_param, product: invalid_attributes}, session: valid_session
        expect(assigns(:product)).to eq(@product)
      end

      it "re-renders the 'edit' template" do
        put :update, params: {id: @product.to_param, product: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested product" do
      expect {
        delete :destroy, params: {id: @product.to_param}, session: valid_session
      }.to change(Product, :count).by(-1)
    end

    it "redirects to the products list" do
      delete :destroy, params: {id: @product.to_param}, session: valid_session
      expect(response).to redirect_to(products_path)
    end
  end

end
