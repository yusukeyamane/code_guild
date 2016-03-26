class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @contracts = Contract.where(answerd_user_id: params[:id])
    @skill_relations = SkillRelation.where(skill_relationable_type: User, skill_relationable_id: params[:id])
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
    params.require(:user).permit(:name, :avatar, :introduce, :email, :avatar_cache)
  end

end
