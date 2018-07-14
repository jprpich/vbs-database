class CreateCrewLeaders < ActiveRecord::Migration[5.1]
  def change
    create_table :crew_leaders do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :church

      t.timestamps
    end
  end
end
