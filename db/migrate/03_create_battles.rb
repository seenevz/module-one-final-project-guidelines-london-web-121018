class CreateBattles < ActiveRecord::Migration
    
    def change
        create_table :battles do |t|
         t.integer :trainer_id
         t.integer :trainer_pokemon_id
         t.integer :enemy_pokemon_id
         t.boolean :win?
        end
    end
end