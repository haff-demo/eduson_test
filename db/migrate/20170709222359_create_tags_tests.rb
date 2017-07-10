class CreateTagsTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tags_tests, id: false do |t|
      t.references :tag
      t.references :test
    end
  end
end
