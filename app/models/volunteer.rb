class Volunteer < ApplicationRecord
  validates :first_name, presence: true  
  validates :last_name, presence: true  
  validates :phone, presence: true  
  validates :email, presence: true  
  validates :church, presence: true  
  validates :role_type, presence: true
  validates :identification, numericality: { less_than_or_equal_to: 2147483647,  only_integer: true }
  enum role_type: { logistics: 0, decoration: 1 }

  scope :by_role_type, -> (role_type) { where("role_type = ?", role_type) }
end