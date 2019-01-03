class Trainer < ActiveRecord::Base
    has_many :trainer_pokemons
    has_many :pokemons, through: :trainer_pokemons
    
    def fight_against
        fought = []
        self.trainer_pokemons.each do |pair|
            if !pair.battles.empty?
                pair.battles.each do |battle|
                    #battle.pokemon.display
                    fought << battle.pokemon
                end
            end
        end
        fought
    end

    def todisplay(todisp)
        todisp.each{|p| p.display}
    end

    def show_fought
        self.todisplay(self.fight_against)
    end

    def wins_against(chosen)
        list = self.fight_against
        tocount = list.select {|p| p == chosen}
        tocount.length

    end

    def win_ratio
        divby = self.fight_against.length
        wins = wins_total
        "your win ratio is: #{(wins/divby)*100}"
    end

    def wins_total
        wins = []
        self.trainer_pokemons.each do |tp|
            tp.battles.each do |b|
                if b.win?
                    wins << b
                end
            end
        end
        if wins.length > 0
            wins.length
        else
            0
        end
    end

    def loss_total
        loss = []
        self.trainer_pokemons.each do |tp|
            tp.battles.each do |b|
                if !b.win? && nil?
                    loss << b
                end
            end
        end
        if loss.length > 0
            loss.length
        else
            0
        end
    end

    def my_record
        puts "#{self.win_ratio} Wins : #{self.wins_total} Losses : #{self.loss_total}"

    end

end
