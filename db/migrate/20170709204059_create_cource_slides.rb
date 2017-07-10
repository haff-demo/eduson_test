class CreateCourceSlides < ActiveRecord::Migration[5.0]
  def change
    create_table :cource_slides do |t|

      t.timestamps
    end
  end
end
