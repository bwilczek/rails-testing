require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Book. As you add validations to Book, be sure to
  # adjust the attributes here as well.
  let(:author) { Author.create!( name: "Author" ) }
  let(:valid_attributes) { { title: "A title", pages: 123, author: author } }
  let(:valid_post_attributes) { { title: "A title", pages: 123, author_id: author } }

  let(:invalid_attributes) { { title: nil, pages: 0, author: nil } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BooksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      book = Book.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      book = Book.create! valid_attributes
      get :show, params: {id: book.to_param}, session: valid_session
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
      book = Book.create! valid_attributes
      get :edit, params: {id: book.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Book" do
        expect {
          post :create, params: {book: valid_post_attributes}, session: valid_session
        }.to change(Book, :count).by(1)
      end

      it "redirects to the created book" do
        post :create, params: {book: valid_post_attributes}, session: valid_session
        expect(response).to redirect_to(Book.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {book: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { pages: 666 } }

      it "updates the requested book" do
        book = Book.create! valid_attributes
        put :update, params: {id: book.to_param, book: new_attributes}, session: valid_session
        book.reload
        expect(book.pages).to be_eql(666)
      end

      it "redirects to the book" do
        book = Book.create! valid_attributes
        put :update, params: {id: book.to_param, book: valid_attributes}, session: valid_session
        expect(response).to redirect_to(book)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        book = Book.create! valid_attributes
        put :update, params: {id: book.to_param, book: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested book" do
      book = Book.create! valid_attributes
      expect {
        delete :destroy, params: {id: book.to_param}, session: valid_session
      }.to change(Book, :count).by(-1)
    end

    it "redirects to the books list" do
      book = Book.create! valid_attributes
      delete :destroy, params: {id: book.to_param}, session: valid_session
      expect(response).to redirect_to(books_url)
    end
  end

  describe "GET #avg_page_count" do
    it "returns a success response" do
      get :avg_page_count, params: {}, session: valid_session
      expect(response).to be_success
    end

    it "renders proper number for all books (cnt=1)" do
      Book.create! valid_attributes
      get :avg_page_count, params: {}, session: valid_session
      expect(response.body).to be_eql('123.0')
    end

    it "renders proper number for all books (cnt=2)" do
      Book.create! valid_attributes.merge(pages: 100)
      Book.create! valid_attributes.merge(pages: 200)
      get :avg_page_count, params: {}, session: valid_session
      expect(response.body).to be_eql('150.0')
    end

    it "renders proper number for 2 books from single author" do
      Book.create! valid_attributes.merge(pages: 100)
      Book.create! valid_attributes.merge(pages: 300)
      get :avg_page_count, params: {author_id: author}, session: valid_session
      expect(response.body).to be_eql('200.0')
    end
  end
end
