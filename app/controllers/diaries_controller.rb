class DiariesController < ApplicationController

  def new
    @diary = current_user.diaries.build
  end

  def create
    @diary = current_user.diaries.build(diary_params)
    if @diary.save
      
    end
  end

  def edit
  end

  private

    def diary_params
      params.require(:diary).permit(:tutle, :content, :written_on, :tag_list)
    end
end
