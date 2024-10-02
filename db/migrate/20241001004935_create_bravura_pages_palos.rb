class CreateBravuraPagesPalos < ActiveRecord::Migration[7.1]
  def change
    create_table :bravura_pages_palos do |t|
      t.string :title
      t.text :content
      t.string :slug
      t.references :account, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
    add_index :bravura_pages_palos, [ :account_id, :slug ], unique: true
  end
end
