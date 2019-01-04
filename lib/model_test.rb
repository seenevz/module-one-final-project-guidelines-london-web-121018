require_relative '../config/environment'


tp1 = TrainerPokemon.second
t1 = Trainer.first
p1 = Pokemon.first
b1 = Battle.new
p2 = Pokemon.last
p3 = Pokemon.find(rand*151)


binding.pry
p 'eof'


###########Game Loop#############
=begin

Intro splash

game world intro
(distopyian pokemon future, no gyms. gain resources in caves)

Main menu
1.new trainer
2.continue previous trainer

if continue previous trainer
    Trainer select
    1.trainer list
else
    choose what people will remember you by(name)
end

search loop until pokemon is chosen
    choose pokemon
    1.by name
    2. by stat(atk, def; etc..)

    search results
    1. choose from the results
    2.go back to chosen search method
    3. go back to search methods menu
end

brief description of the battle dynamics

display stats before fight begin

fight loop until either poke hp == 0
    atk/def
    health check
end

end state

restart game
