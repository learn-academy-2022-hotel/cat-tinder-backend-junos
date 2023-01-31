class CreateToons < ActiveRecord::Migration[7.0]
  def change
    create_table :toons do |t|
      t.string :name
      t.integer :age
      t.string :enjoys_doing
      t.string :image

      t.timestamps
    end
  end
end
