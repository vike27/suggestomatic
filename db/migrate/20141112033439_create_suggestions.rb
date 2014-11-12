class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.integer :suggester_id
      t.text :description
      t.integer :vote_count

      t.timestamps
    end
  end
end
