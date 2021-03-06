require 'rails_helper'

RSpec.describe "books/new", type: :view do
  before(:each) do
    assign(:book, Book.new(
      :pages => 1,
      :title => "MyString",
      :author => nil
    ))
  end

  it "renders new book form" do
    render

    assert_select "form[action=?][method=?]", books_path, "post" do

      assert_select "input#book_pages[name=?]", "book[pages]"

      assert_select "input#book_title[name=?]", "book[title]"

      assert_select "input#book_author_id[name=?]", "book[author_id]"
    end
  end
end
