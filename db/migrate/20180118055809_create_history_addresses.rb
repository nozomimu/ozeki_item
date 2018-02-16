class CreateHistoryAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :history_addresses do |t|
      t.string :postal_code
      t.string :address
      t.string :address_more
      t.string :lastname
      t.string :firstname
      t.string :kana_lastname
      t.string :kana_firstname
      t.string :phone
      t.string :phone2
      t.string :phone3

      t.timestamps
    end
  end
end
