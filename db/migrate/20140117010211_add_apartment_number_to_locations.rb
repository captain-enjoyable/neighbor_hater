class AddApartmentNumberToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :apartment_number, :string
  end
end
