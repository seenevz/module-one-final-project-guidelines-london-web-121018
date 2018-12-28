class CreatePokemons < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :speed
      t.integer :defense
      t.integer :attack
      t.integer :hp
      t.integer :weight
    end
  end
end
