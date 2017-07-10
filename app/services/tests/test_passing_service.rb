module Tests
  class TestPassingService
    def initialize(test)
      @test = test
    end

    def submit_answer(question_id: nil, answer_ids: nil, testable: nil)
      return nil if question_id.nil? || answer_ids.nil? || testable.nil?

      test_passing = TestPassing.find_by(test: @test, testable: testable)
      question = test_passing.test.questions.find(question_id)
      return nil if test_passing.last_question &&
                    question.test_order_number <= test_passing.last_question.test_order_number

      valid_answer_ids = question.answers.valid.pluck(:id)
      if answer_ids.split(',').map(&:to_i) == valid_answer_ids
        test_passing.points_total += question.points
      end

      test_passing.last_question = question
      test_passing.is_finished = (question == @test.questions.last)
      test_passing.save
    end
  end
end
