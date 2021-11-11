class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
    	t.string :title, default: 'unknown book', limit: 100
    	t.integer :page

      t.timestamps
    end
  end
end
