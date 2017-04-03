class Programmer < ApplicationRecord
  validates :name, presence: true
  
  has_many :projects
  has_many :clients, through: :projects
end
