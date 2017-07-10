class CreateTestPassings < ActiveRecord::Migration[5.0]
  def change
    create_table :test_passings do |t|
      t.references :testable, polymorphic: true, index: true
      t.references :test
      t.references :last_question
      t.integer    :points_total, default: 0, null: false
      t.boolean    :is_finished, default: false

      t.timestamps
    end
  end
end
