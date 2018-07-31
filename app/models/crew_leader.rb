class CrewLeader < ApplicationRecord
  validates :first_name, presence: true  
  validates :last_name, presence: true  
  validates :phone, presence: true  
  validates :email, presence: true  
  validates :church, presence: true  
  has_many :children


  def next
    self.class.where("id > ?", id).first
  end
end