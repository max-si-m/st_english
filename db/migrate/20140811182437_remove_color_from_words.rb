class RemoveColorFromWords < ActiveRecord::Migration
  def change
    remove_column :words, :color, :string
  end
end
