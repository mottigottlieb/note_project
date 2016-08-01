class CreateNotebooks < ActiveRecord::Migration
  def change
    create_table :notebooks do |t|
      t.string :title
      t.text :content
      t.references :note, index: true, foreign_key: true
      
    end
  end
end
