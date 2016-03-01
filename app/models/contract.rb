class Contract < ActiveRecord::Base
  belongs_to :contractable, polymorphic: true
  belongs_to :user
end
