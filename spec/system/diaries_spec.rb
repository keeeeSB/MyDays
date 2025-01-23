require 'rails_helper'

RSpec.describe "日記投稿機能", type: :system do
  let(:diary) { FactoryBot.create(:diary) }

  scenario "ユーザーは正常な値を入力すると、日記を投稿できる" do
    user = FactoryBot.create(:user)
    log_in_as user
    expect(page).to have_content "ログインしました。"

    visit root_path
    click_link "今日の記録"

    fill_in "タイトル", with: "花火大会に行きました！"
    fill_in "内容", with: "家族みんなで花火大会に行ってきましたよ！"
    click_button "投稿"

    expect(page).to have_content "今日の日記を投稿しました。"
  end
end
