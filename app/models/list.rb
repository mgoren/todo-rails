class List < ActiveRecord::Base
  has_many :tasks

  validates :name, presence: true
  validates :description, presence: true
end