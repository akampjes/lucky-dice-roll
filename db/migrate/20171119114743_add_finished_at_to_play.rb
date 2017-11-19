class AddFinishedAtToPlay < ActiveRecord::Migration[5.1]
  def change
    add_column :plays, :finished_at, :datetime
  end
end
