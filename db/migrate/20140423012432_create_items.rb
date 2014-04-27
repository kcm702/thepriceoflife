class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :product
      t.string :description
      t.decimal :price, :scale =>10
      t.date :date

      t.timestamps
    end
  end
end
