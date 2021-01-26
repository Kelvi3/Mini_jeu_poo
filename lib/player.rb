class Player

    attr_accessor :name, :life
    
    def initialize(name, life)
        @name = name
        @life = life
    end
 
    def show_state
        puts "#{@name} à #{life} points de vie"
    end

    def gets_dommage(dommage)
        @life = @life - dommage 
        #on enleve dommage a life
        if @life <= 0 
            puts "#{name} a ete tue"
        #si life est inferieur ou egale a zero il est mort
        else 
            puts "#{name} a #{@life} points de vie"
        #si non je donne son nom et sa vie  
        end
    end

    def attacks(player)
        attack = compute_damage
        puts "Le joueur #{@name} attaque le joueur #{player.name}"
        puts "Il lui inflige #{attack} point de dégats" 
        player.gets_dommage(attack)
    end

    def compute_damage
        return rand(1..6)
    end
end

class HumanPlayer < Player

    attr_accessor :weapon_level, :life

    def initialize(name, life)
        @weapon_level = 1
        super(name, life)
    end 
    
    def show_state
       puts "#{name} a #{life} points de vie et une arme de niveau #{@weapon_level}" 
    end

    def compute_damage
        return rand(1..6) * @weapon_level
    end
    #Je cherche un chiffre entre 1 et 6 et je le multiplie a mon arme initial
    def search_weapon
        weapon_random = rand(1..6)
        #nouvelle variable qui prend un chiffre random entre 1 et 6. 
        puts "Tu as trouvé une arme de niveau #{weapon_random}"
        if weapon_random > @weapon_level
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
            return @weapon_level = weapon_random
        #si mon chiffre random est superieur a mon arme initial je return mon num egal a mon arme initial
        else weapon_random <= @weapon_level
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
            return weapon_level
        #autrement si mon random weapon et inferieur ou egal a mon arme initial je la return 
        end
    end
    
    def search_health_pack
        regen_life = rand(1..6)        
        #nouvelle variable qui prend un chiffre random entre 1 et 6. 
        if regen_life == 1
          puts "Tu n'as rien trouvé... "
        #si il est egal a 1 je puts il a rien trouve
        elsif regen_life >= 2 && regen_life <= 5
        #sinon si il est superieur a 2 et inferieur a 5 
          puts"Bravo, tu as trouvé un pack de +50 points de vie !"
            @life += 50
        #j'ajoute 50 a life
            if @life > 100
               @life = 100
            #si life est supérieur 100 je le laisse egale a 100
            end
        else
          puts"Waow, tu as trouvé un pack de +80 points de vie !"
            @life +=80
        #autrement si c'est 6 life on lui ajoute 80
            if @life > 100
               @life = 100
        #si life est supérieur 100 je le laisse egale a 100
            end
        end
    end
end



