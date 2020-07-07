class Book < ApplicationRecord
  has_and_belongs_to_many :authors, dependent: :destroy

  validates :name, presence: true
end
