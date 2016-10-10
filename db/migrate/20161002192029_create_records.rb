class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.references :user, index: true, foreign_key: true
      t.string :schema, null: false
      t.string :use_case, null: false, unique: true
      t.column :record_data, :json, null: false

      t.timestamps null: false
    end
  end
end
