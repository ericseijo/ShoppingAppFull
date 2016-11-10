class Product < ApplicationRecord
  validates :name, presence: true
  
  belongs_to :user, dependent: :destroy
  #has_many :grocery_lists
  #has_many :users, through: :grocery_lists, dependent: :destroy
end
