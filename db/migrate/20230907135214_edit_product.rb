class EditProduct < ActiveRecord::Migration[7.0]
  def change
    change_table :products do |t|
      t.references :category, foreign_key: { to_table: :categories }
    end
  end
end
