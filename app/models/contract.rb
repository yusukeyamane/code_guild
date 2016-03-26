class Contract < ActiveRecord::Base
  has_many :chats
  has_one :review
  belongs_to :contractable, polymorphic: true
  belongs_to :user

  def self.lecture_review_rate_avarage(user_id)

    rate_counter = []
    sum = 0

    if where(host_user_id: user_id, contractable_type: :Lecture).present?
      where(host_user_id: user_id, contractable_type: :Lecture).each do |contract|
        if contract.review
          rate_counter << contract.review.rate
          sum += contract.review.rate
        end
      end
      return (sum / rate_counter.count / 2).round
    else
      return 0
    end
  end

  def self.number_of_lecture_review(user_id)
    where(host_user_id: user_id, contractable_type: :Lecture).count
  end



  def self.question_review_rate_avarage(user_id)

    rate_counter = []
    sum = 0

    if where(guest_user_id: user_id, contractable_type: :Question).present?
      where(guest_user_id: user_id, contractable_type: :Question).each do |contract|
        if contract.review
          rate_counter << contract.review.rate
          sum += contract.review.rate
        end
      end
      return (sum / rate_counter.count / 2).round
    else
      return 0
    end

  end

  def self.number_of_question_review(user_id)
    where(guest_user_id: user_id, contractable_type: :Question).count
  end

end
