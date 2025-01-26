require 'rails_helper'

RSpec.describe Diary, type: :model do
  let(:diary) { FactoryBot.create(:diary) }

  it "ファクトリーが正常に動く" do
    expect(FactoryBot.build(:diary)).to be_valid
  end

  describe "バリデーションのテスト" do
    it "タイトルは必須である" do
      diary.title = " "
      expect(diary).to_not be_valid
    end

    it "内容は必須である" do
      diary.content = " "
      expect(diary).to_not be_valid
    end

    it "日付は必須である" do
      diary.written_on = " "
      expect(diary).to_not be_valid
    end
  end
end
