class Articles < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :desc, presence: true, length: { minimum: 10, maximum: 100 }
end
