

class CreatePokemons < ActiveRecord::Migration
    
    def change
        create_table :pokemons do |t|
         t.integer :index
         t.string :name
         t.integer :speed
         t.integer "special-defense".to_sym
         t.integer "special-attack".to_sym
         t.integer :defense
         t.integer :attack
         t.integer :hp
         t.integer :weight
        end
    end
end