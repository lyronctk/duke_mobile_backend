class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.references :user, index: true, foreign_key: true
      t.string :schema
      t.string :use_case

      t.timestamps null: false
    end
  end
end
