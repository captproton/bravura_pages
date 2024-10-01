class CreateBravuraPagesPalos < ActiveRecord::Migration[7.1]
  def change
    create_table :bravura_pages_palos do |t|
      t.string :title
      t.text :content
      t.string :slug

      t.timestamps
    end
    add_index :bravura_pages_palos, :slug, unique: true
  end
end
