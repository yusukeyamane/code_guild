class Contract < ActiveRecord::Base
  has_many :chats
  has_one :review
  belongs_to :contractable, polymorphic: true
  belongs_to :user

# 注目しているユーザーのlectureに対するレビューの平均値を1~5で取り出す
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
      unless rate_counter.count == 0
        return (sum / rate_counter.count / 2).round
      else
        return 0
      end
    else
      return 0
    end
  end

  #注目しているユーザーのlectureに対して投稿されているレビューの総数を導き出す
  def self.number_of_lecture_review(user_id)
    where(host_user_id: user_id, contractable_type: :Lecture).count
  end


  # 注目しているユーザーが回答した質問に対するレビューの平均値を1~5で取り出す
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
      unless rate_counter.count == 0
        return (sum / rate_counter.count / 2).round
      else
        return 0
      end
    else
      return 0
    end

  end

  #注目しているユーザーが回答した質問に対して投稿されているレビューの総数を導き出す
  def self.number_of_question_review(user_id)
    where(guest_user_id: user_id, contractable_type: :Question).count
  end







# 注目しているユーザーのlectureに対するレビューの平均値を1~5で取り出す
  def lecture_review_rate_avarage

    rate_counter = []
    sum = 0

    if Contract.where(host_user_id: contractable.user_id, contractable_type: :Lecture).present?
      Contract.where(host_user_id: contractable.user_id, contractable_type: :Lecture).each do |c|
        if c.review
          rate_counter << c.review.rate
          sum += c.review.rate
        end
      end
      unless rate_counter.count == 0
        return (sum / rate_counter.count / 2).round
      else
        return 0
      end
    else
      return 0
    end
  end

  #注目しているユーザーのlectureに対して投稿されているレビューの総数を導き出す
  def number_of_lecture_review
    Contract.where(host_user_id: contractable.user_id, contractable_type: :Lecture).count
  end


  # 注目しているユーザーが回答した質問に対するレビューの平均値を1~5で取り出す
  def question_review_rate_avarage

    rate_counter = []
    sum = 0

    if Contract.where(guest_user_id: contractable.user_id, contractable_type: :Question).present?
      Contract.where(guest_user_id: contractable.user_id, contractable_type: :Question).each do |c|
        if c.review
          rate_counter << c.review.rate
          sum += c.review.rate
        end
      end
      unless rate_counter.count == 0
        return (sum / rate_counter.count / 2).round
      else
        return 0
      end
    else
      return 0
    end

  end

  #注目しているユーザーが回答した質問に対して投稿されているレビューの総数を導き出す
  def number_of_question_review
    Contract.where(guest_user_id: contractable.user_id, contractable_type: :Question).count
  end


  #注目しているcontractレコードの最新のchatsのレコードを取得する
  def self.newest_chat_message(contract_id)
    Chat.where(contract_id: contract_id).order("created_at DESC").limit(1).each do |chat|
      return chat.message
    end
  end






end
