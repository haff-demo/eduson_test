class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :user_name, comment: 'username'
      t.integer :role, default: 0, comment: 'role in the app'

      t.timestamps
    end
  end
end
