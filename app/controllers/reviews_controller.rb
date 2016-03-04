class ReviewsController < ApplicationController

  before_action :set_review, only: [:edit, :update]
  before_action :set_contract, only: [:new, :create]

  def new
    @review = current_user.reviews.new
  end

  def create
    @review = current_user.reviews.new(review_params)
    if @review.save
      redirect_to :root, flash: { success: "評価を投稿しました" }
    else
      render action: :new, flash: { success: "評価が正しく投稿されませんでした" }
    end
  end

  def edit
  end


  def update
    if @review.update(review_params)
      redirect_to user_path(current_user), flash: { success: "レビューを編集しました。" }
    else
      render action: :edit
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_contract
    @contract = Contract.find(params[:contract_id])
  end

  def review_params
    params.require(:review).permit(:content).merge(rate: params[:rate], contract_id: params[:contract_id])
  end

end
