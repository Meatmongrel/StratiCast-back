class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
