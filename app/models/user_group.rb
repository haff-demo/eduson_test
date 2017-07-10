class UserGroup < ApplicationRecord
  has_many :users_user_groups
  has_many :users, through: :users_user_groups

  has_many :course_processes, as: :educable
  has_many :courses, through: :course_processes

  has_many :test_passings, as: :testable
  has_many :test, through: :test_passings
end
