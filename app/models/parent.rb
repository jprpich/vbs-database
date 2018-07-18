class Parent < ApplicationRecord
  validates :first_name, presence: true  
  validates :last_name, presence: true  
  validates :phone, presence: true  
  validates :email, presence: true  
  validates :amount_paid, presence: true

  has_many :children, dependent: :destroy

  scope :by_first_name, -> (first_name) { where('first_name LIKE ?', "%#{first_name}%") }

  def self.search(search_term)
    if search_term
      by_first_name(search_term)
    else
      find(:all)
    end
  end

end