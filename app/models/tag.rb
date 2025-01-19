class Tag < ApplicationRecord
  has_many :diary_tags
  has_many :diaries, through: :diary_tags
  
  validates :name, presence: true, uniqueness: true
end
