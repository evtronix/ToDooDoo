class Task < ActiveRecord::Base
  attr_accessible :completed, :description, :list_id

  validates :description, :presence => true

  belongs_to :list

  scope :completed, where(:completed => true)
  scope :incomplete, where(:completed => false)
end
