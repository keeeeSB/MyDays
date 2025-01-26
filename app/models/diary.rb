class Diary < ApplicationRecord
  belongs_to :user
  has_many :diary_tags
  has_many :tags, through: :diary_tags

  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 150 }
  validates :written_on, presence: true

  # 仮装属性：　タグリストを文字列として取得
  def tag_list
    tags.map(&:name).join(' ')
  end

  # 仮装属性：　タグリストを保存
  def tag_list=(names)
    # 全角、半角スペースで分割し、重複を排除
    self.tags = names.split(/[[:space:]]+/).uniq.map do |name|
      Tag.find_or_create_by(name: name.strip)
    end
  end
end
