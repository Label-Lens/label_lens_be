class AddLoginUuidToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :login_uuid, :string
    add_column :users, :login_timestamp, :string
  end
end
