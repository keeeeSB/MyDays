FactoryBot.define do
  factory :user do
    name { "テストユーザー" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
    activated { true }
    activated_at { Time.current }
  end
end
