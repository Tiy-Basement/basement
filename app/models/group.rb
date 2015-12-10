class Group < ActiveRecord::Base
  has_many :users, through: :members
  belongs_to :members
  has_many :events
end
