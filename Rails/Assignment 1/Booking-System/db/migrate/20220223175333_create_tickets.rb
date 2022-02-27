class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :name
      t.decimal :refrence
      t.float :price
      t.string :ids

      t.timestamps
    end
  end
end
