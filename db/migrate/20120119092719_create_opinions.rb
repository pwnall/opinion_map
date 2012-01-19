class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.references :issue
      t.boolean :positive
      t.string :name
      t.text :comment

      t.timestamps
    end
    add_index :opinions, :issue_id
  end
end
