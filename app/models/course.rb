class Course < ApplicationRecord
  has_and_belongs_to_many :tags
  has_many :course_processes
  has_many :users, through: :course_processes, source: :educable, source_type: 'User'
  has_many :user_groups, through: :course_processes, source: :educable, source_type: 'UserGroup'
  has_many :slides, -> { order 'course_order_number ASC' }
  has_many :tests
end
