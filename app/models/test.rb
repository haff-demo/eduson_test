class Test < ApplicationRecord
  has_and_belongs_to_many :tags
  has_many :test_passings
  has_many :users, through: :test_passings, source: :testable, source_type: 'User'
  has_many :user_groups, through: :test_passings, source: :testable, source_type: 'UserGroup'
  has_many :questions, -> { order 'test_order_number ASC' }

  belongs_to :course, optional: true
end
