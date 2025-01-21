FactoryBot.define do
  factory :diary do
    title { "散歩へ行くぞ！" }
    content { "散歩へ行ってきました。" }
    written_on { "2024-01-01" }
    association :user

    # タグ付きの日記を作成するトレイト
    trait :with_tags do
      after(:create) do |diary|
        tags = FactoryBot.create_list(:tag, 2)
        diary_tags << tags
      end
    end
  end
end
