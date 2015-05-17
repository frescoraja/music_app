class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :track_title, null: false
      t.integer :album_id, null: false
      t.integer :ord, null: false
      t.text :lyrics, null: false
      t.boolean :bonus, default: false, null: false

      t.timestamps
    end
    add_index :tracks, [:album_id, :ord], unique: true
  end
end
