class RemoveLoginUuidFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :login_uuid, :string
    remove_column :users, :login_timestamp, :string
  end
end
