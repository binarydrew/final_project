class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :vote_value
      t.references :user, index: true
      t.references :translation, index: true

      t.timestamps
    end
  end
end
