class LecturesController < ApplicationController
  before_action :set_lecture, only: [:show, :edit, :update]

  def index
    @lectures = Lecture.all
  end

  def new
    @lecture = Lecture.new
  end

  def create
    lecture = current_user.lectures.new(lecture_params)
    if lecture.save
      redirect_to :root, notice: "レクチャーを作成しました。"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @lecture.update(lecture_params)
      redirect_to :root, notice: "レクチャーを編集しました。"
    else
      render :edit
    end
  end

  private
  def set_lecture
    @lecture = Lecture.find(params[:id])
  end

  def lecture_params
    params.require(:lecture).permit(:title, :content, :total_avarable_time, :charge)
  end
end
