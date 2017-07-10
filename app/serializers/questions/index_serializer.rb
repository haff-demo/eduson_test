module Questions
  class IndexSerializer < BaseSerializer
    attributes :id, :title, :question_type, :test_order_number
  end
end
