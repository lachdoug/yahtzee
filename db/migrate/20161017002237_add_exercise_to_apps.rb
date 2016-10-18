class AddExerciseToApps < ActiveRecord::Migration[5.0]
  def change
    add_column :apps, :exercise, :boolean
  end
end
