class CourseProcess < ApplicationRecord
  belongs_to :educable, polymorphic: true
  belongs_to :course
  belongs_to :last_slide, class_name: 'Slide', optional: true

  validate :only_one_course_for_educable
  validate :last_slide_belongs_to_related_course

  private

  def only_one_course_for_educable
    return if CourseProcess.where(educable: educable, course: course).where.not(id: id).empty?
    errors.add(:base, 'record for this educable and course already exists')
  end

  def last_slide_belongs_to_related_course
    return if last_slide.nil? || course.slides.pluck(:id).include?(last_slide_id)
    errors.add(:last_slide, 'must be from related course')
  end
end
