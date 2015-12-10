class Group < ActiveRecord::Base
  has_many :users, through: :members
  has_many :members
  belongs_to :user
end
