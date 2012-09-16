class AddGmapsToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :lat, :float
    add_column :pieces, :lng, :float
    add_column :pieces, :gmaps, :boolean
    add_column :pieces, :address, :string
  end
end
