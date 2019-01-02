class TrainerPokemon < ActiveRecord::Base
    has_many :battles
    belongs_to :trainer
    belongs_to :pokemon
end