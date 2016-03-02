class ReviewsController < ApplicationController

  def show
  end

  def new
    @review = Review.new
  end

  def edit
  end

  def update
  end

  def create
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def create_params
  end

end
