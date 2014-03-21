class AddGradesToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :points_v1, :float
    add_column :teams, :points_v2, :float
    add_column :teams, :points_ld1, :float
    add_column :teams, :points_ld2, :float
  end
end
