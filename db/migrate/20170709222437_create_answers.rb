class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.references :question
      t.text :content
      t.boolean :is_valid, default: false, null: false

      t.timestamps
    end
  end
end
