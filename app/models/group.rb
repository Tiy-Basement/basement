class Group < ActiveRecord::Base
  has_many :users, through: :members
  has_many :members
  has_many :events
end
