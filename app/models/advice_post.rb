class AdvicePost < ApplicationRecord
  before_validation :set_descriptionless_description

  validates :description, presence: true
  validates :description, length: { maximum: 100 }

  belongs_to :user

  private

  def set_descriptionless_description
    self.description = '投稿内容なし' if description.blank?
  end
end
