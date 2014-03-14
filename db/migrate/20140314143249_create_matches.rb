class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :grade
      t.date :date
      t.string :opponent
      t.string :winner
      t.string :score
      t.text :description

      t.timestamps
    end
  end
end
