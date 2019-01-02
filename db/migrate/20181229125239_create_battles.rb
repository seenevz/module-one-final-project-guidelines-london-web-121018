class CreateBattles < ActiveRecord::Migration[5.0]
  def change
    create_table :battles do |t|
      t.integer :trainer_pokemon_id
      t.integer :pokemon_id
      t.boolean :win?
    end
  end
end
