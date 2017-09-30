class Author < ApplicationRecord
  validates :name, presence: true
  has_many :books

  def to_s
    name
  end
end
