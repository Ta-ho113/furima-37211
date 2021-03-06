class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string     :post_number,   null: false
      t.integer    :region_id
      t.string     :municipality,  null: false
      t.string     :house_number,  null: false
      t.string     :building_name
      t.string     :phone_number,  null: false
      t.references :order,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
