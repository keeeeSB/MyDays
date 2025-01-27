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

  describe "タグ付けのテスト" do
    it "複数のタグを日記に設定できる" do
      diary.tag_list = "運動　スポーツ"
      diary.save
      expect(diary.tags.pluck(:name)).to contain_exactly("運動", "スポーツ")
    end

    it "重複したタグは一つだけ保存される" do
      diary.tag_list = "運動　スポーツ　運動"
      diary.save
      expect(diary.tags.pluck(:name)).to contain_exactly("運動", "スポーツ")
    end

    describe "スペース区切りでタグを保存" do
      context "半角スペースの場合" do
        it "正しく保存できる" do
          diary.tag_list = "運動 スポーツ 趣味"
          diary.save
          expect(diary.tags.pluck(:name)).to contain_exactly("運動", "スポーツ", "趣味")
        end
      end

      context "全角スペースの場合" do
        it "正しく保存できる" do
          diary.tag_list = "運動　スポーツ　趣味"
          diary.save
          expect(diary.tags.pluck(:name)).to contain_exactly("運動", "スポーツ", "趣味")
        end
      end

      context "半角、全角が混在する場合" do
        it "正しく保存できる" do
          diary.tag_list = "運動 スポーツ　趣味"
          diary.save
          expect(diary.tags.pluck(:name)).to contain_exactly("運動", "スポーツ", "趣味")
        end
      end
    end
  end
end
