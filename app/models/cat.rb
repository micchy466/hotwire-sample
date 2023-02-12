class Cat < ApplicationRecord
  # 名前: 必須
  validates :name, presence: true

  # 年齢: 必須 + integer + 0以上
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create_commit -> { broadcast_prepend_to("cats") }
  after_update_commit -> { broadcast_replace_to("cats") }
  after_destroy_commit -> { broadcast_remove_to("cats") }
end