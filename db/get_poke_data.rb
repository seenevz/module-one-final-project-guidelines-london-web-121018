require "pry"
require 'open-uri'
require 'json'
require 'net/http'

class GetPokeData

    attr_accessor :index, :url

            
    def self.get_pokemons(index)
        url = "https://pokeapi.co/api/v2/pokemon/#{index}/"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response.body        
    end

    def self.filter_info(index)
        pokemon = JSON.parse(self.get_pokemons(index))

        poke_hash = {}

        pokemon.each_key do |info|
            case info 
            when "id"
                poke_hash[:index] = pokemon["id"]
            when "name"
                poke_hash[:name] = pokemon["name"]
            when "stats"
                pokemon[info].each do |stat|
                    poke_hash[stat["stat"]["name"].to_sym] = stat["base_stat"]
                end
            when "weight"
                poke_hash[:weight] = pokemon["weight"]
            end                            
        end
        poke_hash        
    end
    #binding.pry
end