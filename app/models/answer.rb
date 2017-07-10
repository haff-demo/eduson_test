class Answer < ApplicationRecord
  belongs_to :question

  scope :valid, -> { where(is_valid: true) }
end
