class Child < ApplicationRecord
  belongs_to :parent
  belongs_to :crew_leader, optional: true
  validates :first_name, presence: true  
  validates :last_name, presence: true  
  validates :age, presence: true  
  
end