class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :source_link
      t.text :h1
      t.text :h2
      t.text :h3
      t.text :extracted_hrefs

      t.timestamps null: false
    end
  end
end
