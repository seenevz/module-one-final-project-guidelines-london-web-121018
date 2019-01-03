class Battle < ActiveRecord::Base
    belongs_to :trainer_pokemon
    belongs_to :pokemon
end