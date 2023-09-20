class DeleteUsers < ActiveRecord::Migration[7.0]
  def change
    if table_exists?(:users)
      drop_table :users
    end
  end
end
