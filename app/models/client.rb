class Client < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :projects
  has_many :programmers, through: :projects
end
