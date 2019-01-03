class Battle < ActiveRecord::Base
    belongs_to :trainer_pokemon
    belongs_to :pokemon
    after_create :draw_poke
    after_create :trainer_poke

    attr_accessor :trn_poke, :enem_poke

    def attack(def_flag = false)

        if def_flag == false
            self.enem_poke.hp -= (self.trn_poke.attack - (self.enem_poke.defense * rand))
            self.trn_poke.hp -= (self.enem_poke.attack - (self.trn_poke.defense * rand))
        else
            self.trn_poke.hp -= (self.enem_poke.attack / self.trn_poke.defense)
        end
        win?
    end

    def defense
        self.trn_poke.defense += (self.trn_poke.defense * rand)
        self.attack(true)
    end

    private
    
    def trainer_poke
        @trn_poke = self.trainer_pokemon.pokemon
    end

    def draw_poke
        @enem_poke = Pokemon.find(rand(1..151))
        self.update(pokemon_id: self.enem_poke.id)
    end

    def win?
        hp_trn = self.trn_poke.hp
        hp_enem = self.enem_poke.hp
        
        if hp_trn <= 0 && hp_enem > 0
            puts "lost"
            false
        elsif hp_trn > 0 && hp_enem <= 0 
            puts "win"
            true
        else
            puts "go again"
        end
        
    end

end