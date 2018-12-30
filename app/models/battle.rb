class Battle < ActiveRecord::Base
    has_many :pokemons
    has_many :trainers
end