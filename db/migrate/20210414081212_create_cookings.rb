class CreateCookings < ActiveRecord::Migration[6.0]
  def change
    create_table :cookings do |t|
      t.string :cooking_name,            null: false
      t.string :point1,                  null: false
      t.string :point2,                  null: false
      t.string :point3,                  null: false
      t.string :point4,                  null: false
      t.string :point5,                  null: false
      t.string :recipe,                  null: false
      t.string :material,                null: false
      t.integer :production_time_id,     null: false
      t.integer :user_id,                null: false, foreign_key: true

      t.timestamps
    end
  end
end
