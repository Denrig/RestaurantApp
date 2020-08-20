class RenameColumnsForUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :activation_digest, :activation_token
    add_column :users, :activation_created_at, :datetime
    rename_column :users, :reset_digest, :reset_token
    rename_column :users, :reset_send_at, :reset_created_at

    add_column :orders,:one_time_created_at,:datetime
  end
end
