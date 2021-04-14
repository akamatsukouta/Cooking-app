class CreateCookings < ActiveRecord::Migration[6.0]
  def change
    create_table :cookings do |t|
      t.string :cooking_name,            null: false
      t.string :point,                   null: false
      t.string :recipe,                  null: false
      t.integer :user_id,                null: false, foreign_key: true

      t.timestamps
    end
  end
end
