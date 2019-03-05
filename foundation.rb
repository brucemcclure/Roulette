wheel = { 0  => "Green",                                                    #A hash to simulate the roulette wheel, holding all of the numbers and their respective colors
          1 => "Red",
          2 => "Black", 
          3 => "Red", 
          4 => "Black", 
          5 => "Red",
          6 => "Black", 
          7 => "Red",
          8 => "Black", 
          9 => "Red", 
          10 => "Black", 
          11 => "Black", 
          12 => "Red",
          13 => "Black",
          14 => "Red",
          15 => "Black",
          16 => "Red", 
          17 => "Black", 
          18 => "Red", 
          19 => "Red", 
          20 => "Black",
          21 => "Red", 
          22 => "Black",
          23 => "Red", 
          24 => "Black", 
          25 => "Red", 
          26 => "Black", 
          27 => "Red", 
          28 => "Black", 
          29 => "Black", 
          30 => "Red", 
          31 => "Black", 
          32 => "Red", 
          33 => "Black", 
          34 => "Red",
          35 => "Black", 
          36 => "Red"}
          
lines =File.open("ledger.txt").to_a                                                         #Reader method for I/O
player_purse = lines.last.to_f                                                              #Setting purse to 100 for now

#puts "How much money would you like to deposit into your account?"
#player_purse = gets.chomp.to_f
#system "clear"
#
#File.open("ledger.txt", "a") do |line|                                        #Write method to the betting ledger
#    line.puts "\r" + "#{player_purse}"
#end




puts "Welcome to the CoderAcademy Roulette Game"
puts "As a new player we have given you $100 to start with"
#This is where you put the beginning of the while loop
repeat = "y"
while repeat == "y"
    
    p ball_placement = rand(36)                                               #Spinning the wheel and generating a random number 1-36
    p wheel[ball_placement]                                                   #"Fixing the number to one specific variable"
puts "Your current balance is $#{player_purse}"                               #Displaying the current player purse
#*************************************************************************

#*************************************************************************

puts "What type of bet would you like to make? Select from the numbers below:"                                #Laying out the different betting types
puts "1) Red or Black"                #Jo
puts "2) Odd or Even"                 #Jo
puts "3) 1-18"                        #Bruce
puts "4) 19-36"                       #Bruce 
puts "5) 1st Dozen (1-12)"            #Jo
puts "6) 2nd Dozen (13-24)"           #Jo
puts "7) 3rd Dozen (25-36)"           #Jo
puts "8) Column 1"                    #Bruce
puts "9) Column 2"                    #Bruce
puts "10) Column 3"                   #Bruce
puts "11) Single number"              #Both

bet_choice = gets.chomp.to_i

#*************************************************************************
puts "How much would you like to bet?"
bet_amount = gets.chomp.to_f                                                #Initializes the bet amount
    if bet_amount > player_purse                                            #must not be able to bet more than what they have in the purse.
        puts "You cannot bet that much... but youre 'all in'"               
    elsif
        puts "You're betting $#{bet_amount}"                                #Displays how much youre betting
    end 
#*************************************************************************
case bet_choice
    when 1                                                              
        puts "What color would you like to bet on?"                         #1X payout
        color_choice = gets.chomp.capitalize
        if color_choice == wheel[ball_placement]                            #If the color_choice is equal to the associated color of the random number generated (This is taken from the hash)
            puts "Congratulations!!! You won $#{bet_amount * 1}"            #Displays winnings 
            player_purse = (player_purse + (bet_amount * 1))                #Adds winnings to the players purse
            puts "your purse is now $#{player_purse}"                        #Displays new player purse
        else 
            puts "Unlucky... better luck next time"                         #If the color_choice NOT equal to the associated color of the random number generated (This is taken from the hash)
            puts "You lost $#{bet_amount}"                                   #Displays LOSS 
            player_purse = player_purse - bet_amount                        #REMOVES winnings to the players purse
            puts "your purse is now $#{player_purse}"                        #Displays new player purse
       end
#*************************************************************************
    when 2
        puts "Would you like to bet on odds or evens?"
        odd_even = gets.chomp                                               
        case odd_even
        when "even"                                                         #1X payout    #If ball is even 
            if ball_placement == 0                                          #Test for zero
                puts "Unlucky... better luck next time"                     
                puts "You lost $#{bet_amount}"                               #Displays LOSS
                player_purse = player_purse - bet_amount                    #REMOVES loss from the players purse
                puts "your purse is now $#{player_purse}"                    #Displays new player purse
            elsif (ball_placement %2 == 0)                                  #Test for even
                puts "Congratulations!!! You won $#{bet_amount * 1}"        #Displays winnings 
                player_purse = (player_purse + (bet_amount * 1))            #Adds winnings to the players purse
                puts "your purse is now $#{player_purse}"                    #Displays new player purse
            else                                                            #Odd
                puts "Unlucky... better luck next time"
                puts "You lost $#{bet_amount}"                               #Displays LOSS
                player_purse = player_purse - bet_amount                    #REMOVES winnings to the players purse
                puts "your purse is now $#{player_purse}"                    #Displays new player purse
            end
        when "odd" 
            if ball_placement == 0                                          #Test for zero
                puts "Unlucky... better luck next time"                      
                puts "You lost $#{bet_amount}"                               #Displays LOSS
                player_purse = (player_purse - (bet_amount * 1))            #Removes LOSS from the players purse
                puts "your purse is now $#{player_purse}"                    #Displays new player purse
            elsif (ball_placement %2 == 1)
                puts "Congratulations!!! You won $#{bet_amount * 1}"        #Test for odd
                puts "You won $#{bet_amount}"                                #Displays WIN
                player_purse = player_purse + bet_amount                    #Adds winnings to the players purse
                puts "your purse is now $#{player_purse}"                    #Displays new player purse
            else
                puts "Unlucky... better luck next time"                     #Effectively Zero
                puts "You lost $#{bet_amount}"                               #Displays LOSS
                player_purse = player_purse - bet_amount                    #REMOVES Loss from the players purse
                puts "your purse is now $#{player_purse}"                    #Displays new player purse
            end
        else
            puts "Unlucky... better luck next time"                         
            puts "You lost $#{bet_amount}"                                   #Displays LOSS
            player_purse = player_purse - bet_amount                        #REMOVES Loss to the players purse
            puts "your purse is now $#{player_purse}"                        #Displays new player purse
        end
#*************************************************************************
    when 3
        if ball_placement <= 18 && ball_placement >= 1                      #If ball placement 1-18 #2X payout
            puts "Congratulations!!! You won $#{bet_amount * 2}"            #Displays winnings 
            player_purse = (player_purse + (bet_amount * 2))                #Adds winnings to the players purse
            puts "your purse is now $#{player_purse}"                        #Displays new player purse
        else
            puts "Unlucky... better luck next time"
            puts "You lost $#{bet_amount}"                                   #Displays LOSS
            player_purse = player_purse - bet_amount                        #REMOVES winnings to the players purse
            puts "your purse is now $#{player_purse}"                        #Displays new player purse
        end
 #*************************************************************************   
    when 4
        if ball_placement <= 36 && ball_placement >= 19                     #If ball placement 19-36 #2X payout
            puts "Congratulations!!! You won $#{bet_amount * 2}"            #Displays winnings 
            player_purse = (player_purse + (bet_amount * 2))                #Adds winnings to the players purse
            puts "your purse is now $#{player_purse}"                        #Displays new player purse
        else
            puts "Unlucky... better luck next time"
            puts "You lost $#{bet_amount}"                                   #Displays LOSS
            player_purse = player_purse - bet_amount                        #REMOVES winnings to the players purse
            puts "your purse is now $#{player_purse}"                        #Displays new player purse
        end
#*************************************************************************        
    when 5
        if ball_placement <= 12 && ball_placement >= 1                      #If ball placement 1-12 #2X payout
            puts "Congratulations!!! You won $#{bet_amount * 2}"            #Displays winnings 
            player_purse = (player_purse + (bet_amount * 2))                #Adds winnings to the players purse
            puts "your purse is now $#{player_purse}"                        #Displays new player purse
        else
            puts "Unlucky... better luck next time"
            puts "You lost $#{bet_amount}"                                   #Displays LOSS
            player_purse = player_purse - bet_amount                        #REMOVES winnings to the players purse
            puts "your purse is now $#{player_purse}"                        #Displays new player purse
        end
#*************************************************************************
    when 6
        if ball_placement <= 24 && ball_placement >= 13                     #If ball placement 13-24 #2X payout
            puts "Congratulations!!! You won $#{bet_amount * 2}"            #Displays winnings 
            player_purse = (player_purse + (bet_amount * 2))                #Adds winnings to the players purse
            puts "your purse is now $#{player_purse}"                        #Displays new player purse
        else
            puts "Unlucky... better luck next time"
            puts "You lost $#{bet_amount}"                                   #Displays LOSS
            player_purse = player_purse - bet_amount                        #REMOVES winnings to the players purse
            puts "your purse is now $#{player_purse}"                        #Displays new player purse
        end
#************************************************************************
    when 7 
        if ball_placement <= 36 && ball_placement >= 25                     #If ball placement 25-36 #2X payout
            puts "Congratulations!!! You won $#{bet_amount * 2}"            #Displays winnings 
            player_purse = (player_purse + (bet_amount * 2))                #Adds winnings to the players purse
            puts "your purse is now $#{player_purse}"                        #Displays new player purse
        else
            puts "Unlucky... better luck next time" 
            puts "You lost $#{bet_amount}"                                   #Displays LOSS
            player_purse = player_purse - bet_amount                        #REMOVES winnings to the players purse
            puts "your purse is now $#{player_purse}"                        #Displays new player purse
        end
#************************************************************************
    when 8 
        column_1 = [1,4,7,10,13,16,19,22,25,28,31,34]
        if column_1.include? ball_placement                                 #If ball placement is within 1 column #2X payout
            puts "Congratulations!!! You won $#{bet_amount * 2}"            #Displays winnings 
            player_purse = (player_purse + (bet_amount * 2))                #Adds winnings to the players purse
            puts "your purse is now $#{player_purse}"                        #Displays new player purse
        else 
            puts "Unlucky... better luck next time"
            puts "You lost $#{bet_amount}"                                   #Displays LOSS
            player_purse = player_purse - bet_amount                        #REMOVES winnings to the players purse
            puts "your purse is now $#{player_purse}"                        #Displays new player purse
        end
    
#************************************************************************
    when 9 
        column_2 = [2,5,8,11,14,17,20,23,26,29,32,35]
        if column_2.include? ball_placement                                 #If ball placement is within 2nd column #2X payout
            puts "Congratulations!!! You won $#{bet_amount * 2}"            #Displays winnings 
            player_purse = (player_purse + (bet_amount * 2))                #Adds winnings to the players purse
            puts "your purse is now $#{player_purse}"                        #Displays new player purse
        else 
            puts "Unlucky... better luck next time"
            puts "You lost $#{bet_amount}"                                   #Displays LOSS
            player_purse = player_purse - bet_amount                        #REMOVES winnings to the players purse
            puts "your purse is now $#{player_purse}"                        #Displays new player purse
        end
#************************************************************************
    when 10
        column_3 = [3,6,9,12,15,18,21,24,27,30,33,36]
        if column_3.include? ball_placement                                 #If ball placement is within 3rd column #2X payout
            puts "Congratulations!!! You won $#{bet_amount * 2}"            #Displays winnings 
            player_purse = (player_purse + (bet_amount * 2))                #Adds winnings to the players purse
            puts "your purse is now $#{player_purse}"                        #Displays new player purse
        else 
            puts "Unlucky... better luck next time"
            puts "You lost $#{bet_amount}"                                   #Displays LOSS
            player_purse = player_purse - bet_amount                        #REMOVES winnings to the players purse
            puts "your purse is now $#{player_purse}"                        #Displays new player purse
        end
#************************************************************************
    when 11
        puts "You're a rebel..." 
        puts "What number would you like to bet on?"
        bet_number = gets.chomp.to_i                                       #Initializing the bet number 
        if bet_number == ball_placement                                    #If ball placement is exactly the same #35X payout
            puts "Congratulations!!! You won $#{bet_amount * 35}"          #Displays winnings 
            player_purse = (player_purse + (bet_amount * 35))              #Adds winnings to the players purse
            puts "your purse is now $#{player_purse}"                       #Displays new player purse
        else
            puts "Seriously... That was never going to happen"
            puts "You lost $#{bet_amount}"                                  #Displays LOSS
            player_purse = player_purse - bet_amount                       #REMOVES winnings to the players purse
            puts "your purse is now $#{player_purse}"                       #Displays new player purse
        end
#************************************************************************        
end                                                                        #End of case bet choice
#************************************************************************
File.open("ledger.txt", "a") do |line|                                        #Write method to the betting ledger
    line.puts "\r" + "#{player_purse}"
end
#************************************************************************
puts "Would you like to play again? (y/n)"
repeat = gets.chomp
system "clear"
end