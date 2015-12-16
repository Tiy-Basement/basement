class Groups_User < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
end
