class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.string :content
      t.references :user, index: true
      t.references :posted_lang, index: true
      t.references :trans_lang, index: true

      t.timestamps
    end
  end
end
