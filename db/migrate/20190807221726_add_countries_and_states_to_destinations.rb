class AddCountriesAndStatesToDestinations < ActiveRecord::Migration[4.2]
  def change
  	add_column :destinations, :country, :string
  	add_column :destinations, :state, :string
  end
end
