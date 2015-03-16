class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.column :name, :string

      t.timestamps
    end
  end
end
