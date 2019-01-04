require_relative '../config/environment'
require_relative '../lib/run'

prompt = TTY::Prompt.new()
#splash = TTY::Font.new(:straight)
#splash2 = TTY::Font.new(:doom)


splash
game_intro
t1 = 0
while t1 == 0
    main_menu = prompt.select("Select an option!", {"New trainer" => "new", "Existing trainer" => "exist"}, marker: ">>")
    if main_menu == "new"
        user = prompt.collect do 
            key(:name).ask("what's your name?")
        end
        t1.name = user[:name]
        t1.save
    else
        search_trainer = prompt.select("Select yourself!", trainer_opts, marker: ">>", filter: true)
    
    end
end

t1 = Trainer.new
user = prompt.collect do 
    key(:name).ask("what's your name?")
end
t1.name = user[:name]
t1.save
tp1 = TrainerPokemon.new
tp1.trainer = t1
tp1.save

#battle_move = prompt.select("Choose your move!", {"Attack" => "attack", "Defend" => "defend"}, marker: ">>")





while !t1.trainer_pokemons.last.pokemon
    select_menu = prompt.select("how we search?", {"Search by name" => "name", "Search by stats" => "stats"}, marker: ">>")
    #while select_menu != "back"
        if select_menu == "name"
            select_pokemon = prompt.select("Choose your pokemon #{user[:name]}!", poke_opts, marker: ">>", filter: true, help: "Type back to get to previous menu")
            if select_pokemon != "go back"
                tp1.pokemon_id = select_pokemon
                tp1.save
            end
        elsif select_menu == "stats"
            search_param = prompt.select("which stat we select?", ["Hp", "Speed", "Attack", "Defense", "Weight"], marker: ">>")
            param_value = prompt.ask("What is the value?")
            tp Pokemon.find_by_stat(search_param, param_value)
            select_poke_from_param = prompt.select("Choose your pokemon #{user[:name]}", poke_stats_opt(search_param, param_value))
            if select_poke_from_param != "go back"
                tp1.pokemon_id = select_poke_from_param
                tp1.save
            end
        end
    #end

end





# puts splash2.write("pokemon")
# puts splash2.write("created by andersson")



#Collapse 
#Message Input

#Message Sergio Neves

#Files


