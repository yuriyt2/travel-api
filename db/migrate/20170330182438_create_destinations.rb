class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :description
      t.string :img_url
      t.float :latitude
      t.float :longitude
      t.timestamps null: false
    end
  end
end
