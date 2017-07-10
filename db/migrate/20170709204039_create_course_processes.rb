class CreateCourseProcesses < ActiveRecord::Migration[5.0]
  def change
    create_table :course_processes do |t|
      t.references :educable, polymorphic: true, index: true
      t.references :course
      t.references :last_slide

      t.timestamps
    end
  end
end
