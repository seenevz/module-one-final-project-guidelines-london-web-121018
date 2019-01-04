require_relative '../config/environment'
require_relative '../lib/run'

prompt = TTY::Prompt.new()
splash2 = TTY::Font.new(:doom)
quit = nil
while !quit
    splash
    game_intro
    t1 = 0
    while t1 == 0
        main_menu = prompt.select("Select an option!", {"New trainer" => "new", "Existing trainer" => "exist", "Quit"=>true}, marker: ">>")
        if main_menu == "new"
            user = prompt.collect do 
                key(:name).ask("what's your name?")
            end
            t1 = Trainer.new
            t1.name = user[:name]
            t1.save
        elsif main_menu == "exist"
            search_trainer = prompt.select("Select yourself!", trainer_opts, marker: ">>", filter: true)
            if search_trainer != "go back"
                t1 = Trainer.find_by(name: search_trainer)
            end
        elsif main_menu == true
            quit = true
            break
        end
    end
    if t1 == 0
        break
    end

    tp1 = TrainerPokemon.new
    tp1.trainer = t1
    tp1.save

    #battle_move = prompt.select("Choose your move!", {"Attack" => "attack", "Defend" => "defend"}, marker: ">>")

    while !t1.trainer_pokemons.last.pokemon
        select_menu = prompt.select("how we search?", {"Search by name" => "name", "Search by stats" => "stats"}, marker: ">>")
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
    end

    btl = Battle.create(trainer_pokemon: tp1)
    max_hp_trn = tp1.pokemon.hp
    max_hp_enem = btl.pokemon.hp

    battle_dynamics(t1.name)

    prompt.say("You've encountered a wild pokemon!", color: :red)
    tp btl.pokemon

    while btl.win? == nil
        prompt.say("HP: #{btl.trn_poke.hp}/#{max_hp_trn} --- Enemy HP: #{btl.enem_poke.hp}/#{max_hp_enem} \n")
        battle_move = prompt.select("Choose your move!", {"Attack" => "attack", "Defend" => "defend"}, marker: ">>")
        if battle_move == "attack"
            btl.attack
        elsif battle_move == "defend"
            btl.defense        
        end

    end

    if btl.win? == true
        puts splash2.write("win")
    elsif btl.win? == false
        puts splash2.write("lost")
    end






end