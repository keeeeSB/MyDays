require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  it "正常にファクトリーが動く" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "正常な値を入力すると、ユーザーが作成できる" do
    user = User.new(
      name: "テストユーザー",
      email: "tester@example.com",
      password: "password",
      password_confirmation: "password"
    )
    expect(user).to be_valid
  end

  describe "バリデーションのテスト" do
    it "お名前は必須である" do
      user.name = " "
      expect(user).to_not be_valid
    end

    it "メールアドレスは必須である" do
      user.email = " "
      expect(user).to_not be_valid
    end

    it "メールアドレスは一意である" do
      user.update(email: "tester@example.com")
      duplicate_user = FactoryBot.build(:user,
                                        email: "tester@example.com")
    expect(duplicate_user).to_not be_valid
    end

    it "パスワードは最低6文字以上である" do
      user.password = "a" * 5
      user.password_confirmation = "a" * 5
      expect(user).to_not be_valid

      user.password = "a" * 6
      user.password_confirmation = "a" * 6
      expect(user).to be_valid
    end
  end
end
