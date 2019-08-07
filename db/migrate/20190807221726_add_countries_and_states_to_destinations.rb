class AddCountriesAndStatesToDestinations < ActiveRecord::Migration
  def change
  	add_column :destinations, :country, :string
  	add_column :destinations, :state, :string
  end
end
