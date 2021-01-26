require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


player1 = Player.new("José", 10)
player2 = Player.new("Josiane", 10)

puts "----------------------------"
puts "Voici l'état de nos joueurs :"
print "#{player1.show_state}"
print "#{player2.show_state}"
puts "----------------------------"
puts
puts "----------------------------"
puts "Passons à la phase d'attaque"
print "#{player2.attacks(player1)}"
print "#{player1.attacks(player2)}"
puts "----------------------------"
puts 
puts "----------------------------"
while player1.life > 0 && player2.life > 0 
    puts player2.attacks(player1)
    break if player1.life <= 0 
    puts player1.attacks(player2)
end
puts "----------------------------"

