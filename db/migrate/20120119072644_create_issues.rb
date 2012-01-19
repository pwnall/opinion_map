class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :name
      t.boolean :closed

      t.timestamps
    end
  end
end
