require 'rails_helper'

RSpec.describe "books/edit", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      :pages => 1,
      :title => "MyString",
      :author => Author.create!( :name => "Name" )
    ))
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(@book), "post" do

      assert_select "input#book_pages[name=?]", "book[pages]"

      assert_select "input#book_title[name=?]", "book[title]"

      assert_select "input#book_author_id[name=?]", "book[author_id]"
    end
  end
end
