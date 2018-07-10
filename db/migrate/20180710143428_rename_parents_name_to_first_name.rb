class RenameParentsNameToFirstName < ActiveRecord::Migration[5.1]
  def change
    rename_column :parents, :name, :first_name
  end
end
