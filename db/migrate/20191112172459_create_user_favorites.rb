class CreateUserFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :user_favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :favorite, null: false, foreign_key: true

      t.timestamps
    end
  end
end
