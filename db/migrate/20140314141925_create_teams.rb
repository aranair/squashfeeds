class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.float :points_a
      t.float :points_b
      t.float :points_c
      t.float :points_d
      t.float :points_e
      t.float :points_f

      t.timestamps
    end
  end
end
