require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:tag) { FactoryBot.create(:tag) }

  it "正常にファクトリーが動く" do
    expect(FactoryBot.build(:tag)).to be_valid
  end

  it "正常な値を入力すると、タグが作成できる" do
    tag = Tag.new(
      name: "旅行"
    )
    expect(tag).to be_valid
  end

  describe "バリデーションのテスト" do
    it "タグ名は必須である" do
      tag.name = " "
      expect(tag).to_not be_valid
    end
  end
end
