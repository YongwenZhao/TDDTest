class ChangeTimeType < ActiveRecord::Migration
  def change
  	change_column :comments, :time, :datetime
  end
end
