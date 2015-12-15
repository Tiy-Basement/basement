class Group < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :events
  has_many :member_events, through: :users, source: :user
end
