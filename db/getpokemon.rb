require 'pry'
require 'open-uri'
require 'json'
require 'net/http'

class GetPokemon

    

    def self.obtain_pokemon(id = 1)
        uri = URI.parse("https://pokeapi.co/api/v2/pokemon/#{id}/")
        response = Net::HTTP.get_response(uri)
        poke = response.body
        poke = JSON.parse(poke)
        poke
    end


    def self.buildpokehash(id = 1)
        nhash = {}
        self.obtain_pokemon(id).each do |param, val|
            if param == "name"
                nhash[param.to_sym] = val
            end
            if param == "stats"
                val.each do |statsArray|
                    if statsArray["stat"]["name"] == "speed" 
                        nhash[statsArray["stat"]["name"].to_sym] = statsArray["base_stat"]
                    end
                    if statsArray["stat"]["name"] == "defense" 
                        nhash[statsArray["stat"]["name"].to_sym] = statsArray["base_stat"]
                    end
                    if statsArray["stat"]["name"] == "attack" 
                        nhash[statsArray["stat"]["name"].to_sym] = statsArray["base_stat"]
                    end
                    if statsArray["stat"]["name"] == "hp" 
                        nhash[statsArray["stat"]["name"].to_sym] = statsArray["base_stat"]
                    end
                end    
            end
            if param == "weight"
                nhash[param.to_sym] = val
            end
        end
        nhash
    end
end