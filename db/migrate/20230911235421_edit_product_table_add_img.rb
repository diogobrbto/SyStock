class EditProductTableAddImg < ActiveRecord::Migration[7.0]
  def change
    change_table :products do |t|
      t.references :image, foreign_key: { to_table: :active_storage_attachments }
    end
  end
end
