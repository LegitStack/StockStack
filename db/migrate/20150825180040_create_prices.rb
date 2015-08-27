class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :ticker
      t.datetime :when
      t.float :high
      t.float :low
      t.float :open
      t.float :close
      t.integer :price_id

      t.timestamps
    end
  end
end
