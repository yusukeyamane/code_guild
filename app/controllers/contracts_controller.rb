class ContractsController < ApplicationController
  def index
    @host_question_contracts = Contract.where(host_user_id: current_user.id, contractable_type: :question)
    @guest_question_contracts = Contract.where(guest_user_id: current_user.id, contractable_type: :question)
    @host_lecture_contracts = Contract.where(host_user_id: current_user.id, contractable_type: :lecture)
    @guest_lecture_contracts = Contract.where(guest_user_id: current_user.id, contractable_type: :lecture)
  end
end
