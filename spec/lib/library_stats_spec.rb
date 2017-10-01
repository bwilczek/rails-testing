require 'rails_helper'

RSpec.describe LibraryStats do
  it 'average for one entry from FactoryGirl' do
    book = build(:book, pages: 300)
    avg = LibraryStats.new.avg_page_count(Array(book))
    expect(avg).to be_eql(300.0)
  end

  it 'average for two entries from FactoryGirl' do
    book1 = build(:book, pages: 100)
    book2 = build(:book, pages: 300)
    avg = LibraryStats.new.avg_page_count([book1, book2])
    expect(avg).to be_eql(200.0)
  end
end
