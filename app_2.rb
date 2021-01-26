require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'




puts "
╔════════════════╗
|   Good luck    |
╚════════════════╝"
 


puts "Entre ton pseudo"
name = gets.chomp
user = HumanPlayer.new(name, 100)
enemies_arr = Array.new
player1 = Player.new("arc_José", 10)
player2 = Player.new("arc_Josiane", 10)
enemies_arr << player1
enemies_arr << player2

while user.life > 0 && (player1.life > 0 || player2.life > 0)
    
    puts "-------------MENU----------------"
    puts "Quelle action veut-tu effectuer ?"
    puts 
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts 
    puts "attaquer un joueur en vue :"
    print "0 - "
    if player1.life < 0
        puts "arc_José a #{player1.life = 0} point de vie"
    else 
        puts player1.show_state
    end
    print "1 - "
    if player2.life < 0
        puts "arc_Josiane a #{player2.life = 0} point de vie"
    else 
        puts player2.show_state
    end    
    puts "-------------MENU----------------"
    
    puts 
    puts "Que veut tu faire"
    menu = gets.chomp
    puts
    if menu == "a"
        puts user.search_weapon
    end
    if menu == "s" 
        puts user.search_health_pack
    end
    if menu == "0"
        if  player1.life > 0
            user.attacks(player1)
        else 
            return "#{player1.life = 0}"
            puts "il est mort passe au deuxieme joueur"
        end
    end 
    if menu == "1"
        if  player2.life > 0
            user.attacks(player2)
        else 
            return "#{player2.life = 0}"
            puts "il est mort passe au deuxieme joueur"
        end
    end
    puts "-----------------------------"
    
    sleep(3)
    puts "Les bots t'attaquent !"

    enemies_arr.each do |bot|
        next if bot.life <= 0
        if user.life <= 0
            puts "Tu es mort"
        elsif user.life > 0
            bot.attacks(user)
        end 
    end
    
    puts "-----------------------------"
    
    puts "tu as #{user.life} point de vie"
    
    
end

if user.life <= 0
    puts "LOSER ! Tu as perdu !" 
end
if player1.life <= 0 && player2.life <= 0
    puts "       ᐠ⸜ˎ_ˏ⸝^⸜ˎ_ˏ⸝^⸜ˎ_ˏ⸝ᐟ      "
    puts " ▁▂▃▅▇BRAVO! TU AS GAGNE!▇▆▅▃▂"
end