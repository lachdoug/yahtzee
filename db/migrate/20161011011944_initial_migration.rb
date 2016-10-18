class InitialMigration < ActiveRecord::Migration[5.0]
  def change

    create_table :chapters do |t|
      t.string :name
      t.text :preface
      t.integer :order
      t.timestamps
    end

    create_table :pages do |t|
      t.integer :chapter_id
      t.text :preface
      t.string :name
      t.integer :order
      t.timestamps
    end

    create_table :sections do |t|
      t.integer :page_id
      t.string :name
      t.text :body
      t.integer :order
      t.timestamps
    end

    create_table :games do |t|
      t.integer :user_id
      t.integer :roll_count
      t.string :dice
      t.integer :score
      t.timestamps
    end

  end
end
