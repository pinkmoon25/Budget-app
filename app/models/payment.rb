class Payment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_and_belongs_to_many :categories

  validates :name, presence: true, length: { maximum: 100,
                                             too_long: '%<count>s characters is the maximum allowed' }
  validates :amount, numericality: true
end
