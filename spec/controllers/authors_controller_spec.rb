require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Author. As you add validations to Author, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { name: 'Kasia' } }

  let(:invalid_attributes) { { name: nil } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AuthorsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      author = Author.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      author = Author.create! valid_attributes
      get :show, params: {id: author.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      author = Author.create! valid_attributes
      get :edit, params: {id: author.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Author" do
        expect {
          post :create, params: {author: valid_attributes}, session: valid_session
        }.to change(Author, :count).by(1)
      end

      it "redirects to the created author" do
        post :create, params: {author: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Author.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {author: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { name: 'Marzena' } }

      it "updates the requested author" do
        author = Author.create! valid_attributes
        put :update, params: {id: author.to_param, author: new_attributes}, session: valid_session
        author.reload
        expect(author.name).to be_eql('Marzena')
      end

      it "redirects to the author" do
        author = Author.create! valid_attributes
        put :update, params: {id: author.to_param, author: valid_attributes}, session: valid_session
        expect(response).to redirect_to(author)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        author = Author.create! valid_attributes
        put :update, params: {id: author.to_param, author: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested author" do
      author = Author.create! valid_attributes
      expect {
        delete :destroy, params: {id: author.to_param}, session: valid_session
      }.to change(Author, :count).by(-1)
    end

    it "redirects to the authors list" do
      author = Author.create! valid_attributes
      delete :destroy, params: {id: author.to_param}, session: valid_session
      expect(response).to redirect_to(authors_url)
    end
  end

end
