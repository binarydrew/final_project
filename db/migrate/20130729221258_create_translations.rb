class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string :content
      t.references :user, index: true
      t.references :phrase, index: true

      t.timestamps
    end
  end
end
