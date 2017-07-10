class Slide < ApplicationRecord
  belongs_to :course
  validate :uniq_number_for_course

  private

  def uniq_number_for_course
    existed_nums = course.slides.where.not(id: id).pluck(:course_order_number)
    return unless existed_nums.include? course_order_number
    errors.add(:course_order_number, 'course_order_number already exist')
  end
end
