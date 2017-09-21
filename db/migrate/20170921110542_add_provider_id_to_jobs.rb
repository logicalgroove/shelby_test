class AddProviderIdToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :provider_id, :integer
    add_index :jobs, :provider_id
  end
end
