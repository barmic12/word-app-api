class Word < ApplicationRecord
  validates :description, presence: true
end
