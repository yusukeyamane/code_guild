class QuestionsController < ApplicationController

  before_action :set_question, except: [:index, :new, :create, :search]
  before_action :authenticate_user!, only: [:new, :contract]

  def index
    @questions = Question.all
  end

  def search
    @questions = Question.where("content LIKE(?)", "%#{params[:keyword]}%").limit(10)
    @questions = Question.where { (content.like "%#{keyword}%") | (title.like "%#{keyword}%") }
    render action: "index"
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
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
        ContractMailer.question_contract_notificate(contract).deliver_now
        redirect_to controller: :contracts, action: :index
      else
        render :show
      end

    else
      redirect_to action: :index, notice: "Sorry...この質問はすでに対応されています。"
    end
  end

  def purchase
    webpay = WebPay.new(WEBPAY_SECRET_KEY)
    webpay.charge.create(currency: 'jpy', amount: @question.reward, card: params['webpay-token'])
    redirect_to controller: :contracts, action: :index, flash: { success: "支払いが完了しました！" }
  end

  private
  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :content, :timelimit, :reward)
  end

end
