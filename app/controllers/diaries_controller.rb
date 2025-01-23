class DiariesController < ApplicationController

  def index
    @diaries = current_user.diaries.order(created_at: :desc)
  end

  def new
    @diary = current_user.diaries.build
  end

  def create
    @diary = current_user.diaries.build(diary_params)
    @diary.written_on = Time.current
    if @diary.save
      flash[:success] = "今日の日記を投稿しました。"
      redirect_to root_path
    else
      flash.now[:danger] = "日記を投稿できませんでした。"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @diary = current_user.diaries.find(params[:id])
  end

  def update
    @diary = current_user.diaries.find(params[:id])
    if @diary.update(diary_params)
      flash[:success] = "日記を更新しました。"
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    @diary = current_user.diaries.find(params[:id])
    @diary.destroy!
    flash[:success] = "日記を削除しました。"
    redirect_to root_path, status: :see_other
  end

  private

    def diary_params
      params.require(:diary).permit(:title, :content, :written_on, :tag_list)
    end
end
