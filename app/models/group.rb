class Group < ActiveRecord::Base
  has_many :users, through: :members
  has_many :members
  belongs_to :user
  belongs_to :members
  has_many :events
end
