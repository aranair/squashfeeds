class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :grade
      t.date :date
      t.string :opponent
      t.string :winner
      t.integer :score
      t.integer :opponent_score
      t.string :result
      t.text :description

      t.timestamps
    end
  end
end
