class AddPriceToBooks < ActiveRecord::Migration[6.0]
  def up
  	add_column :books, :price, :float
  	change_column :books, :title, :string, limit: 150
  end
end
