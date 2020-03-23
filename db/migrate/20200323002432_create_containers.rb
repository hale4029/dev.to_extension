class CreateContainers < ActiveRecord::Migration[5.2]
  def change
    create_table :containers do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :description
    end
  end
end
