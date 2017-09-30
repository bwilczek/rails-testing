class Book < ApplicationRecord
  belongs_to :author
  validates :title, presence: true
  validates :pages, presence: true, numericality: { greater_than: 0 }
end
