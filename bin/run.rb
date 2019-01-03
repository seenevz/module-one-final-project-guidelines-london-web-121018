require_relative '../config/environment'

t1 = Trainer.create
t2 = Trainer.create
pk1 = Pokemon.find(rand * 100)
pk2 = Pokemon.find(rand * 100)
tp1 = TrainerPokemon.create(trainer_id: t1.id, pokemon_id: pk1.id )
tp2 = TrainerPokemon.create(trainer_id: t2.id, pokemon_id: pk2.id )
btl1 = Battle.create(trainer_pokemon_id: tp1.id)
btl2 = Battle.create(trainer_pokemon_id: tp2.id)



binding.pry
puts "done!!"
