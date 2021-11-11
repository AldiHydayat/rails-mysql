class AddDescriptionToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :description, :text
    rename_column :books, :page, :pages
  end

  # def up
  # 	change_column :books, :title, :string, limit: 200
  # end

end
