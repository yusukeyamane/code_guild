class LecturesController < ApplicationController

  def index
    @lectures = Lecture.all
  end

  def new
    @lecture = Lecture.new
  end

  def create
    Lecture.create(lecture_params)
    redirect_to :root
  end

  private
  def lecture_params
    params.require(:lecture).permit(:title, :content, :total_avarable_time, :charge).merge(user_id: current_user.id)
  end
end
