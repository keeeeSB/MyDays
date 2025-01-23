module DiariesHelper

  def formatted_date(diary)
    diary.written_on.strftime("%Y年%m月%d日")
  end
end
