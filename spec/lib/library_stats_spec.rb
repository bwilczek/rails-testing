require 'rails_helper'

RSpec.describe LibraryStats do
  it 'average for one entry from FactoryGirl' do
    book = build(:book, pages: 300)
    avg = LibraryStats.avg_page_count(Array(book))
    expect(avg).to be_eql(300.0)
  end

  it 'average for two entries from FactoryGirl' do
    book1 = build(:book, pages: 100)
    book2 = build(:book, pages: 300)
    avg = LibraryStats.avg_page_count([book1, book2])
    expect(avg).to be_eql(200.0)
  end

  it 'average for one entry with mocked pages method' do
    book = build(:book)
    allow(book).to receive(:pages) { 300 }
    avg = LibraryStats.avg_page_count(Array(book))
    expect(avg).to be_eql(300.0)
  end

  it 'should call pages method on book object' do
    book = build(:book)
    allow(book).to receive(:pages) { 300 }
    LibraryStats.avg_page_count(Array(book))
    expect(book).to have_received(:pages)
  end

  it 'average for two test double entries' do
    book1 = double(:book1, pages: 100)
    book2 = double(:book2, pages: 300)
    avg = LibraryStats.avg_page_count([book1, book2])
    expect(avg).to be_eql(200.0)
  end
end
