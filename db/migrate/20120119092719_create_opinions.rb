class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.references :issue
      t.boolean :positive
      t.string :name
      t.string :city
      t.decimal :lat, precision: 15, scale: 10
      t.decimal :lng, precision: 15, scale: 10
      t.text :comment

      t.timestamps
    end
    add_index :opinions, [:issue_id, :name], unique: true
  end
end
