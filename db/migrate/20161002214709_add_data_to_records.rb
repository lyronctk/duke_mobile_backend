class AddDataToRecords < ActiveRecord::Migration
  def change
  	add_column :records, :data, :json
  end
end
