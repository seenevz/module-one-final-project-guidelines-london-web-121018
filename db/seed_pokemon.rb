require_relative "../app/models/pokemon.rb"
require_relative "get_poke_data.rb"



def seed

    151.times do |i|
        Pokemon.create(GetPokeData.filter_info(i+1))
    end
end