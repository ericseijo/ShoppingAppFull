class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  #has_many :grocery_lists
  #has_many :groceries, through: :grocery_lists, dependent: :destroy
  
  has_many :products, dependent: :destroy
  has_many :shopping_lists, dependent: :destroy
  
  def full_name
    [first_name, last_name].join(' ')
  end
end
