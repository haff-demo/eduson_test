class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.integer :question_type, default: 0, null: false
      t.integer :points
      t.string  :title
      t.integer :test_order_number
      t.references :test

      t.timestamps
    end
  end
end
