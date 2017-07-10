class CreateCoursesTags < ActiveRecord::Migration[5.0]
  def change
    create_table :courses_tags, id: false do |t|
      t.references :tag
      t.references :course
    end
  end
end
