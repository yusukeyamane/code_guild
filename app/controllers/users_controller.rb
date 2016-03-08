class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @reviews = Review.where(user_id: params[:id])
  end

  def edit
  end

  def update
    @user.update(user_params) ? (render :show, notice: 'ユーザー情報が更新されました') : (render :edit, alert: 'ユーザー情報の更新に失敗しました')
  end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :thumbnail, :introduce, :email, :skill_list, :thumbnail_cache)
  end

end
