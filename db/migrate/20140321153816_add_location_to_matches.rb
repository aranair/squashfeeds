class AddLocationToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :location, :text
  end
end
