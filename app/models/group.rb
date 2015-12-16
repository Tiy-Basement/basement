class Group < ActiveRecord::Base
  has_many :groups_users
  has_many :users, through: :groups_users
  has_many :events
  # has_many :member_events, through: :users,
  #   source: :events
end


## Three big fixes I can think of:
### 1) Fix the has_many through. (Obviously, we've tried this.)
### 2) Turn it into two queries:
    #  1. @users = @group.users.pluck(:id)
    #  2. @events = Event.where(owner_id: @users)
### 3) ActiveRecord::Base.execute("SELECT foo FROM ...")
    # You can dive down and do raw SQL but the pain in the ass
    # converting it back to Ruby/ActiveRecord objects after.
