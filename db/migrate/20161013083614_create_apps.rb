class CreateApps < ActiveRecord::Migration[5.0]
  def change
    create_table :apps do |t|
      t.integer :user_id
      t.string :label
      t.boolean :published
      t.text :file
      t.timestamps
    end
  end
end
