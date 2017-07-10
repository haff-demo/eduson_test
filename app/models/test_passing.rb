class TestPassing < ApplicationRecord
  belongs_to :testable, polymorphic: true
  belongs_to :test
  belongs_to :last_question, class_name: 'Question', optional: true

  validate :only_one_test_in_process_for_testable
  validate :last_question_belongs_to_related_test

  private

  def only_one_test_in_process_for_testable
    return if TestPassing.where(testable: testable, test: test)
                         .where.not(id: id)
                         .where(is_finished: false)
                         .empty?
    errors.add(:base, 'this test already in passing process')
  end

  def last_question_belongs_to_related_test
    return if last_question.nil? || test.questions.pluck(:id).include?(last_question_id)
    errors.add(:last_question, 'must be from related test')
  end
end
