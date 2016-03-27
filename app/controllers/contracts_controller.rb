class ContractsController < ApplicationController

  before_action :authenticate_user!

  def index
    @contracts = Contract.where(situation: :doing)
    @host_question_contracts = Contract.where(host_user_id: current_user.id, contractable_type: :question)
    @guest_question_contracts = Contract.where(guest_user_id: current_user.id, contractable_type: :question)
    @host_lecture_contracts = Contract.where(host_user_id: current_user.id, contractable_type: :lecture)
    @guest_lecture_contracts = Contract.where(guest_user_id: current_user.id, contractable_type: :lecture)
  end

  def search

    if params[:category_form] == "All"
      if params[:usertype_form] == "usertype_all"
        @contracts = Contract.where(situation: params[:contract_situation_form])
      elsif params[:usertype_form] == "usertype_host"
        @contracts = Contract.where(host_user_id: current_user.id, situation: params[:contract_situation_form])
      elsif params[:usertype_form] == "usertype_guest"
        @contracts = Contract.where(guest_user_id: current_user.id ,situation: params[:contract_situation_form])
      end
    else
      if params[:usertype_form] == "usertype_all"
        @contracts = Contract.where(contractable_type: params[:category_form], situation: params[:contract_situation_form])
      elsif params[:usertype_form] == "usertype_host"
        @contracts = Contract.where(contractable_type: params[:category_form], host_user_id: current_user.id, situation: params[:contract_situation_form])
      elsif params[:usertype_form] == "usertype_guest"
        @contracts = Contract.where(contractable_type: params[:category_form], guest_user_id: current_user.id ,situation: params[:contract_situation_form])
      end
    end

  end



end
