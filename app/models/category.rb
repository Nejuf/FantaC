class Category < ActiveRecord::Base
  validates :name, presence: true
  validates :name, length: { in: 1..40 }
  validates :name, uniqueness: true

  has_many :contests
end
