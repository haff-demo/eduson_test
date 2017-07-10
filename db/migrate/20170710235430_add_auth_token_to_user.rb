class AddAuthTokenToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :auth_token, :string, null: false, comment: 'auth token for user'
  end
end
