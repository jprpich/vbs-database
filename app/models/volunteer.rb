class Volunteer < ApplicationRecord
  validates :first_name, presence: true  
  validates :last_name, presence: true  
  validates :phone, presence: true  
  validates :email, presence: true  
  validates :church, presence: true  
  
  enum role_type: { logistics: 0, decoration: 1 }
end