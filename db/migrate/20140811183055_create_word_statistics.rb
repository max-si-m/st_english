class CreateWordStatistics < ActiveRecord::Migration
  def change
    create_table :word_statistics do |t|
      t.references :word, index: true
      t.integer :views
      t.integer :know
      t.integer :unknow

      t.timestamps
    end
  end
end
