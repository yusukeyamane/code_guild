class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :contract

  validates :content,
            :rate,
            presence: true
end
