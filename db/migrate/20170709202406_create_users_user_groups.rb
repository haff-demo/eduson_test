class CreateUsersUserGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :users_user_groups do |t|
      t.references :user
      t.references :user_group

      t.timestamps
    end
  end
end
