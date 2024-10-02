# db/migrate/20241001000707_create_bravura_pages_static_pages.rb
class CreateBravuraPagesStaticPages < ActiveRecord::Migration[7.1]
  def change
    create_table :bravura_pages_static_pages do |t|
      t.string :title
      t.text :content
      t.datetime :published_at
      t.string :slug
      t.references :account, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
    add_index :bravura_pages_static_pages, [ :account_id, :slug ], unique: true
  end
end
