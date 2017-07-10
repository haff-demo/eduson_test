module Api
  class TestsController < BaseApiController
    def index
      tests = Test.all
      render json: tests, each_serializer: ::Tests::IndexSerializer
    end

    def show
      test = Test.find(params[:id])
      render json: test, serializer: ::Tests::ShowSerializer
    end
  end
end
