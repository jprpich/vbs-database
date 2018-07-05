class CreateParents < ActiveRecord::Migration[5.1]
  def change
    create_table :parents do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :church
      t.integer :amount_paid

      t.timestamps
    end
  end
end
