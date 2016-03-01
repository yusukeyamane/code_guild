class Question < ActiveRecord::Base
  has_one :contract, as: :contractable
  belongs_to :user
end
