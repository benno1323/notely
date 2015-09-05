class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :content
      t.boolean :share

      t.timestamps null: false
    end
  end
end
