json.extract! book, :id, :pages, :title, :author_id, :created_at, :updated_at
json.url book_url(book, format: :json)
