require 'rails_helper'

describe "ログイン機能", type: :system do
  let(:user) { FactoryBot.create(:user) }

  scenario "正常な値を入力すると、ログインできる" do
    visit root_path
    click_link "ログイン"

    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: "password"
    click_button "ログイン"

    expect(current_path).to eq user_path(user)
    expect(page).to have_content "ログインしました。"
    expect(page).to have_content "#{user.name}さんのプロフィール"
  end
end
