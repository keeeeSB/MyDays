class Diary < ApplicationRecord
  belongs_to :user
  has_many :diary_tags
  has_many :tags, through: :diary_tags
end
