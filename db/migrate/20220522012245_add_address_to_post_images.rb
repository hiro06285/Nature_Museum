class AddAddressToPostImages < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :address, :string
    add_column :post_images, :latitude, :float
    add_column :post_images, :longitude, :float
  end
end
