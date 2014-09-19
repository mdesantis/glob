class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.text :content
      t.references :page, index: true
      
      t.timestamps
    end
  end
end
