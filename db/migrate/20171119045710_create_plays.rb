class CreatePlays < ActiveRecord::Migration[5.1]
  def change
    create_table :plays do |t|
      t.string :flybuys_number
      t.integer :points
      t.integer :bet

      t.timestamps
    end
  end
end
