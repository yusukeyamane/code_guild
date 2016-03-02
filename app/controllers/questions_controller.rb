class QuestionsController < ApplicationController

  before_action :set_question, only: [:show, :edit, :update, :destroy, :contract]
  before_action :authenticate_user!, only: [:new]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    question = current_user.questions.new(question_params)
    if question.save
      redirect_to action: :index, flash: { success: "質問を投稿しました。" }
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to action: :index, flash: { success: "質問を編集しました。" }
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to action: :index, flash: { success: "質問を削除しました。" }
  end

  def contract
    if Contract.where(contractable_id: params[:id]).where(contractable_type: :Question).blank?
      contract = Contract.new(contractable_id: params[:id], contractable_type: :Question, host_user_id: @question.user.id, guest_user_id: current_user.id)

      if contract.save
        redirect_to controller: :contracts, action: :index
      else
        render :show
      end

    else
      redirect_to action: :index, notice: "Sorry...この質問はすでに対応されています。"
    end
  end

  private
  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :content, :timelimit, :reward)
  end

end
