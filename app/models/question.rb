class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validate :uniq_number_for_test
  validates :question_type, :points, :test_order_number, presence: true

  enum question_type: [:multiple, :single]

  private

  def uniq_number_for_test
    existed_nums = test.questions.where.not(id: id).pluck(:test_order_number)
    return unless existed_nums.include? test_order_number
    errors.add(:test_order_number, 'test_order_number already exist')
  end
end
