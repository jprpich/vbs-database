class AddRoleTypeToHacker < ActiveRecord::Migration[5.1]
  def change
    add_column :hackers, :role_type, :integer
  end
end
