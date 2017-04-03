class Project < ApplicationRecord
  validates :description, presence: true

  belongs_to :programmer
  belongs_to :client

  has_one :schedule
end
