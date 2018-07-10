class AddLastNameToParents < ActiveRecord::Migration[5.1]
  def change
    add_column :parents, :last_name, :string
  end
end
