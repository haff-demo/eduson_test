module Questions
  class ShowSerializer < BaseSerializer
    attributes :id, :title, :question_type, :test_order_number, :content
    has_many :answers, serializer: ::Answers::IndexSerializer
  end
end
