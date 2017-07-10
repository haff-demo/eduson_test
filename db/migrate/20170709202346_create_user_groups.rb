class CreateUserGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :user_groups do |t|
      t.string :group_name, comment: 'visible name of group'

      t.timestamps
    end
  end
end
