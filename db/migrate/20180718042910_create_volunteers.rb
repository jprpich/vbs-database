class CreateVolunteers < ActiveRecord::Migration[5.1]
  def change
    create_table :volunteers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :church
      t.integer :age
      t.integer :identification
      t.integer :role_type  

      t.timestamps
    end
  end
end
