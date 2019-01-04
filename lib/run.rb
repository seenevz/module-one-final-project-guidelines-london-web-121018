LOGO = File.read("lib/logo.txt")
CREATED = File.read("lib/created.txt")
NAMES = File.read("lib/names.txt")
def splash
    system "clear"
    puts CREATED
    sleep(3)
    puts NAMES
    sleep(3)
    system "clear"
    puts LOGO
end

def game_intro
    puts "In this world Trainers dive into the depth of caves crawling with hostile pokemon.
    where the last of the regions pokemon reside"
    sleep(3)
end

def battle_dynamics(trainer)
    puts "during your battle #{trainer}, you will not be able to run!"
    sleep(3)
    puts "Either raise your defense or attack. Pro tip don't lose!"
    sleep(3)
    puts "It's all you #{trainer}!"
end

def poke_opts
    pk1 = {}

    Pokemon.all.map {|p| pk1[p.name.capitalize] = p.id}
    pk1["Go back"] = "go back"
    pk1
end

def poke_stats_opt(search_p, param_v)
    pk1 = {}

    Pokemon.find_by_stat(search_p, param_v).map {|p| pk1[p.name.capitalize] = p.id}
    pk1["Go back"] = "go back"
    pk1
end

def trainer_opts
    tr1 = {}

    Trainer.all.map {|t| tr1[t.name] = t.id}
    tr1["Go back"] = "go back"
    tr1
end


