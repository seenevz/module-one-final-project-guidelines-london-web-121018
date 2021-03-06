prompt = TTY::Prompt.new()

class Battle < ActiveRecord::Base
    belongs_to :trainer_pokemon
    belongs_to :pokemon
    after_create :draw_poke
    after_create :trainer_poke

    attr_accessor :trn_poke, :enem_poke

    def attack(def_flag: false)
        prompt = TTY::Prompt.new()

        if def_flag == false
            self.enem_poke.hp -= ((self.trn_poke.attack * self.trn_poke.attack) / (self.trn_poke.attack + self.enem_poke.defense))
            if won?
                return
            end

            if [true, false].sample 
                self.trn_poke.hp -= ((self.enem_poke.attack * self.enem_poke.attack) / (self.enem_poke.attack + self.trn_poke.defense))
                prompt.say("Enemy chose attack!", color: :red)
                won?
            else
                defense(enem_poke)
                prompt.say("Enemy chose defend!", color: :red)
            end 
        else
            self.trn_poke.hp -= ((self.enem_poke.attack * self.enem_poke.attack) / (self.trn_poke.attack + self.trn_poke.defense))
            won?
        end
        
    end

    def defense(value = trn_poke)
        
        value.defense += (value.defense * rand)
        self.attack(def_flag: true) unless value == enem_poke
    end
    
    def won?
        hp_trn = self.trn_poke.hp
        hp_enem = self.enem_poke.hp
        
        if hp_trn <= 0 && hp_enem > 0
            #puts "lost"
            self.update(win?: false)
        elsif hp_trn >= 0 && hp_enem < 0
            #puts "win"
            self.update(win?: true)
        else
            #puts "go again"
        end
        #binding.pry
    end

    private
    
    def trainer_poke
        @trn_poke = self.trainer_pokemon.pokemon
    end

    def draw_poke
        @enem_poke = Pokemon.find(rand(1..151))
        self.update(pokemon_id: self.enem_poke.id)
    end


end