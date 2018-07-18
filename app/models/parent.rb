class Parent < ApplicationRecord
  validates :first_name, presence: true  
  validates :last_name, presence: true  
  validates :phone, presence: true  
  validates :email, presence: true  
  validates :amount_paid, presence: true

  has_many :children, dependent: :destroy

  scope :by_first_name, -> (first_name) { 
    where('lower(first_name) LIKE ?', "%#{first_name.downcase}%") 
  }

  scope :by_church, -> (church) { 
    where('lower(church) LIKE ?', "%#{church.downcase}%") 
  }

end