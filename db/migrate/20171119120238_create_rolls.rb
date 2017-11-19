class CreateRolls < ActiveRecord::Migration[5.1]
  def change
    create_table :rolls do |t|
      t.integer :result
      t.integer :play_id

      t.timestamps
    end
  end
end
