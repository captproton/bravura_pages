class CreateBravuraPagesStaticPages < ActiveRecord::Migration[7.1]
  def change
    create_table :bravura_pages_static_pages do |t|
      t.string :title, null: false
      t.string :slug
      t.text :content
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
    add_index :bravura_pages_static_pages, [:account_id, :slug], unique: true
  end
end
