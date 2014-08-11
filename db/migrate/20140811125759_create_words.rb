class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :original
      t.string :translit
      t.string :color

      t.timestamps
    end
  end
end
