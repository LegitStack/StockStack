class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :ticker
      t.datetime :when
      t.float :high
      t.float :low
      t.float :open
      t.float :close
      t.text :other

      t.timestamps
    end
  end
end
