class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :name
      t.integer :user_id
      t.string :description
      t.integer :status

      t.timestamps
    end
  end
end
