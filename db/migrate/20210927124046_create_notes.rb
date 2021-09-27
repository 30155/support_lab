class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :word,      null: false
      t.string :word_kana, null: false
      t.text :summary
      t.text :text
      t.text :reference
      t.references :user,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
