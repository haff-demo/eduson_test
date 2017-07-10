module Api
  module Tests
    class QuestionsController < BaseApiController
      def index
        question_list = Test.find(params[:test_id]).questions
        render json: question_list, each_serializer: ::Questions::IndexSerializer
      end

      def show
        question = Question.find_by(test_id: params[:test_id], id: params[:id])
        render json: question, serializer: ::Questions::ShowSerializer
      end

      def submit_answer
        test = Test.find(params[:test_id])
        res = ::Tests::TestPassingService.new(test)
                                         .submit_answer(question_id: params[:question_id],
                                                       answer_ids: params[:answer_ids],
                                                       testable: current_api_user)
        if res
          head :ok
        else
          head :unprocessable_entity
        end
      end
    end
  end
end
