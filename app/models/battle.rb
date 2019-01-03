class Battle < ActiveRecord::Base
    has_many :pokemons
    has_many :trainers
    after_create :draw_poke

    attr_accessor :trn_poke, :enem_poke

    def trainer_poke(selection)
        @trn_poke = Pokemon.find(selection)
        self.update(trainer_pokemon_id: self.trn_poke.id)
    end

    def attack(def_flag = false)

        if def_flag == false
            self.enem_poke.hp -= (self.trn_poke.attack / self.enem_poke.defense)
            self.trn_poke.hp -= (self.enem_poke.attack / self.trn_poke.defense)
        else
            self.trn_poke.hp -= (self.enem_poke.attack / self.trn_poke.defense)
        end
    end

    def defense
        self.trn_poke.defense += (self.trn_poke.defense * rand)
        self.attack(true)
    end

    private

    def draw_poke
        @enem_poke = Pokemon.find((rand * 100).round)
        self.update(enemy_pokemon_id: self.enem_poke.id)
    end

end