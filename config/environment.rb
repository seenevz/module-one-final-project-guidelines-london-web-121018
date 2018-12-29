require 'bundler'
Bundler.require

require "pry"



class GetPokeData

    attr_accessor :index, :url

    def initialize(index)
        @index = index
        @url = "https://pokeapi.co/api/v2/pokemon/#{@index}/"
    end

    URL = "https://pokeapi.co/api/v2/pokemon/#{@index}/"

    def get_pokemons
        uri = URI.parse(self.url)
        response = Net::HTTP.get_response(uri)
        response.body        
    end

    def filter_info
        pokemon = JSON.parse(self.get_pokemons)

        poke_hash = {}

        pokemon.each_key do |info|
            case info 
            when "id"
                poke_hash["id"] = pokemon["id"]
            when "name"
                poke_hash["name"] = pokemon["name"]
            when "stats"
                pokemon[info].each do |stat|
                    poke_hash[stat["stat"]["name"]] = stat["base_stat"]
                end
            when "weight"
                poke_hash["weight"] = pokemon["weight"]
            end                            
        end
        poke_hash
    end
    #binding.pry
end

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/pokemon.db')
require_all 'lib'
