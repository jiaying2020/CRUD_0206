class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :price
      t.string :integer

      t.timestamps
    end
  end
end
