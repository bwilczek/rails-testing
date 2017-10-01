class LibraryStats
  def avg_page_count(collection)
    sum = collection.inject(0.0) { |acc, book| acc += book.pages }
    sum / collection.count
  end
end
