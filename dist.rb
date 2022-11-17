sold = 20000

class Distributeur
 
    def minBills(x)
        if x / 20000 > 0
            print "#{x / 20000} x 20 000Ar" 
        end
        if (x % 20000) / 10000 > 0
            print "+ #{(x % 20000) / 10000} x 10 000Ar"
        end
        if ((x % 20000) % 10000) / 5000 > 0
            print "#{((x % 20000) % 10000) / 5000} x 5000Ar"
        end 
        puts "\n \n"
    end

    def balancedBills(x)
        i=j=k=0
        while x >= 20000 || x >= 10000 || x >= 5000
            if x >= 20000
                x = x - 20000
                i += 1
            end
            if x >= 10000
                x = x - 10000
                j += 1
            end
            if x >= 5000
                x = x - 5000
                k += 1
            end
        end
        if i>0
            puts "#{i} x 20 000 Ar \n"
        end
        if j>0
            puts "#{j} x 10 000 Ar \n"
        end
        if k>0
            puts "#{k} x 5000 Ar \n"
        end
    end
end




def choixDeLangue(x)
    if x == 1
        puts "Bienvenue dans votre distributeur de billets \n"
    end
    if x == 2
        puts "Tongasoa eto amin'ny mpandrindra ny volanao \n"
    end
    if x == 3
        puts "Welcome to gab"
    end
end

def choiceMethod(x)
    case x
    when 1 
        puts "Voulez vous retirer : \n \t 1 - le minimum de billets \n \t 2 - une balance de billets"
    when 2
        puts "Ho alainao ho \n \t 1 - vola maivana \n \t 2 - vola mitovy isa"
    when 3 
        puts "want you to take \n \t 1 - minimum of bills \n \t 2 - equality of bills"
    else 
        puts "undefined"
    end
end

def meth2(x)
    if x == 1
        puts "\t 1 - Ajouter de l'argent \n \t 2 - Retirer de l'argent \n"
    end
    if x == 2
        puts "\t 1 - Hanampy vola \n \t 2 - Hisintona vola \n"
    end
    if x == 3
        puts "\t 1 - Add money \n \t 2 - Retrieve money \n"
    end
end

def meth3(x)
    if x == 1
        puts "Veuillez entrer le montant : "
    end
    if x == 2
        puts "Ampidiro ilay sandambola : "
    end
    if x == 3
        puts "Type de money value : "
    end
end

def meth(x, y)
    if x == 1
        n = Distributeur.new
        n.minBills(y)
    elsif x == 2
        n = Distributeur.new
        n.balancedBills(y)
    end
end


#Programme principale
t = 0
begin
    begin
        puts "\t Veuillez choisir la langue : \n \t Safidio ny teny : \n \t Choose a language : \n"
        puts "--------------------------------------------------------------------------------------"
        puts "\t 1 - Français \n \t 2 - Malagasy \n \t 3 - English \n"
        puts "--------------------------------------------------------------------------------------"
        langue = gets.chomp.to_i
        choixDeLangue(langue)
    
        begin
            meth2(langue)
            retouajout = gets.chomp.to_i

            if retouajout == 1
                begin
                    meth3(langue)
                    montant = gets.chomp.to_i
                    if montant >= 5000
                        sold = sold + montant
                    end
                    puts "Votre argent est maintenant #{sold}"
                    puts "--------------------------------------------------------------------------------------"
                end while montant < 5000
            end

            if retouajout == 2
                puts "--------------------------------------------------------------------------------------"
                choiceMethod(langue)
                begin
                    methode = gets.chomp.to_i
                    begin
                        puts "Entrer le montant a retirer : \n"
                        montant = gets.chomp.to_i
                    end while montant < 20000

                    if montant > sold
                        puts "Vous ne pouvez pas en retirer car votre argent est insuffisant"
                    end

                    if montant < sold
                        meth(methode, montant)
                        sold = sold - montant
                        puts "Votre solde est maintenant #{sold}"
                        puts "--------------------------------------------------------------------------------------"
                    end
                end while methode > 2
            end
        end while retouajout > 2
    end while langue > 3
end while t < 1
