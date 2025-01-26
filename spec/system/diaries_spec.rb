require 'rails_helper'

RSpec.describe "日記投稿機能", type: :system do
  let(:user) { FactoryBot.create(:user) }

  before do
    log_in_as user
    expect(page).to have_content "ログインしました。"

    visit root_path
    click_link "今日の記録"
  end

  scenario "ユーザーは日記を投稿できる" do
    fill_in "タイトル", with: "花火大会に行きました！"
    fill_in "内容", with: "家族みんなで花火大会に行ってきましたよ！"
    click_button "投稿"

    expect(page).to have_content "今日の日記を投稿しました。"
    expect(current_path).to eq user_diaries_path(user)
    expect(page).to have_content "花火大会に行きました！"
  end
end
