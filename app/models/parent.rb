class Parent < ApplicationRecord
  validates :name, presence: true  
  validates :phone, presence: true  
  validates :email, presence: true  
  validates :amount_paid, presence: true

  # has_many :children
end