class Category < ActiveRecord::Base
  validates :name, presence: true

  validates :name, length: { in: 1..30 }

  has_many :contests
end
