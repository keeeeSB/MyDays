require 'rails_helper'

describe "ユーザー登録機能", type: :system do
  include ActiveJob::TestHelper
  
  scenario "ユーザーは正常にユーザー登録ができる" do
    visit root_path
    click_link "新規登録"

    fill_in "お名前", with: "テストユーザー"
    fill_in "メールアドレス", with: "test@example.com"
    fill_in "パスワード", with: "password"
    fill_in "パスワード再確認", with: "password"
    click_button "登録"

    expect(page).to \
      have_content "アカウント承認メールを送信しました。確認してください。"
    expect(current_path).to eq root_path

    mail = ActionMailer::Base.deliveries.last

    aggregate_failures do
      expect(mail.to).to eq ["test@example.com"]
      expect(mail.from).to eq ["mydays@example.com"]
      expect(mail.subject).to eq "アカウント承認"
    end
  end
end
