class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.string :title
      t.string :description
      t.integer :userid
      t.integer :categoryid
    end
  end
end
