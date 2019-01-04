class Pokemon < ActiveRecord::Base
    has_many :trainer_pokemon
    has_many :battles
    
    def display
        

        puts "
        ---------------------------
        Pokemon : #{self.name}
        HP : #{self.hp}
        Attack : #{self.attack}
        Defense : #{self.defense}
        Speed : #{self.speed}
        Weight : #{self.weight}
        ---------------------------
        "
        
    end
    def self.find_by_atk(attack)
        selected = Pokemon.all.where("attack <= ?", attack).order("attack DESC").limit(5)
        num = 1
        selected.each do |p|
            puts "                    |#{num}|"
            num+=1
            p.display
        end
        selected
    end
    def self.find_by_def(defense)
        selected = Pokemon.all.where("defense <= ?", defense).order("defense DESC").limit(5)
        num = 1
        selected.each do |p|
            puts "                    |#{num}|"
            num+=1
            p.display
        end
        selected
    end
    def self.find_by_hp(hp)
        selected = Pokemon.all.where("hp <= ?", hp).order("hp DESC").limit(5)
        num = 1
        selected.each do |p|
            puts "                    |#{num}|"
            num+=1
            p.display
        end
        selected
    end
    def self.find_by_spd(speed)
        selected = Pokemon.all.where("speed <= ?", speed).order("speed DESC").limit(5)
        num = 1
        selected.each do |p|
            puts "                    |#{num}|"
            num+=1
            p.display
        end
        selected
    end
    def self.find_by_wt(weight)
        selected = Pokemon.all.where("weight <= ?", weight).order("weight DESC").limit(5)
        num = 1
        selected.each do |p|
            puts "                    |#{num}|"
            num+=1
            p.display
        end
        selected
    end

    def self.find_by_stat(stat, value)
        selected = Pokemon.all.where("#{stat} <= ?", value).order("#{stat} DESC").limit(5)

        selected
    end
    


    
end