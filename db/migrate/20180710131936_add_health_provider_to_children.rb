class AddHealthProviderToChildren < ActiveRecord::Migration[5.1]
  def change
    add_column :children, :health_provider, :string
  end
end
