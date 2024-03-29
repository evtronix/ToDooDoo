class List < ActiveRecord::Base
  attr_accessible :description, :name
  validates :name, :presence => true

  has_many :tasks 
  belongs_to :user
end
