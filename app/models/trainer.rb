class Trainer < ActiveRecord::Base
    has_many :battles
    has_many :pokemons, trough: :battles
end