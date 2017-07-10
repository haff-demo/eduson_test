class CreateSlides < ActiveRecord::Migration[5.0]
  def change
    create_table :slides do |t|
      t.string :title
      t.references :course
      t.integer :course_order_number

      t.timestamps
    end
  end
end
