class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :score
      t.integer :judge_id
      t.integer :contestant_id

      t.timestamps(null: false)
    end
  end
end
