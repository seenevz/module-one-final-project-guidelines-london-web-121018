require_relative 'getpokemon.rb'
require_relative '../app/models/pokemon.rb'


151.times do |i|
    Pokemon.create(GetPokemon.buildpokehash(i+1))
end

