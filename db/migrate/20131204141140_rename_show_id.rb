class RenameShowId < ActiveRecord::Migration
  def change
  	rename_column :comments, :showId, :show_id
  end
end
