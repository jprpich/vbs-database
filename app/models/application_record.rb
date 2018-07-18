class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :by_first_name, -> (first_name) { 
    where('lower(first_name) LIKE ?', "%#{first_name.downcase}%") 
  }

  scope :by_church, -> (church) { 
    where('lower(church) LIKE ?', "%#{church.downcase}%") 
  }
end
