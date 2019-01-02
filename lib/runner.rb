require_relative '../config/environment'


def run_now
    puts 'hello, whats your name?'
    p = gets.chomp
    t1 = Trainer.create(name: p)

    puts "hello #{p}, you are now a trainer"
    
end

def find_pokemon
    i = false
    while i == false
    puts "Search for a pokemon by name, dont mispell!
        Enter your choice:"
        p = gets.chomp
        if Pokemon.all.find_by(name: p)
            Pokemon.find_by_name(p)
            i = true
        else
            puts "Incorrect!"
        end
    end
    

end

#run_now

find_pokemon