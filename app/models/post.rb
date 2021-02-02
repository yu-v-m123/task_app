class Post < ApplicationRecord
  validates :title, presence: true
  validates :start, presence: true
  validate :start,
  def not_before_finish
    errors.add(:start, "は終了日以前の日付で選択してください") if start.nil? || start > finish
  end
  validates :finish, presence: true
  validate :finish,
  def not_after_today
    errors.add(:finish, "は今日以降の日付で選択してください") if finish.nil? || finish < Date.today
  end
  validates :memo, length: { in: 0..500 }
end
