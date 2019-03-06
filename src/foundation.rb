system "clear"                                                               #Clears screen to maintain neatness
#*************************************************************************
def win_bet (ball_placement, wheel,bet_amount , odds, player_purse)          #Win method
    puts "."
    sleep(1)
    puts "."
    sleep(1)
    puts "."
    sleep(1)
    puts "the ball landed on #{ball_placement}, #{wheel[ball_placement]}"     #Displays where ball landed
    puts "Congratulations!!! You won $#{bet_amount * odds}"                   #Displays winnings
    player_purse = (player_purse + (bet_amount * odds))                       #Adds winnings to the players purse
    puts "your purse is now $#{player_purse}"
    return player_purse                                                       #Displays new player purse
end

def lose_bet (ball_placement, wheel,bet_amount , player_purse)                #Loss method
    puts "."
    sleep(1)
    puts "."
    sleep(1)
    puts "."
    sleep(1)
    puts "the ball landed on #{ball_placement}, #{wheel[ball_placement]}"     #Displays where ball landed 
    puts "Unlucky... better luck next time"
    puts "You lost $#{bet_amount}"                                            #Displays LOSS
    player_purse = player_purse - bet_amount                                  #Removes LOSS from the players purse
    puts "your purse is now $#{player_purse}"                                 #Displays new player purse
    return player_purse                                                       
end

def social                                                                          #Social awareness warning method
    puts "Warning: you are broke"
    puts "Consider calling the gambling help line on  1800 858 858"
    puts "Consider using the Growth-Mindset app. Developed by Luke and Sid in 2019"
end

#*************************************************************************
wheel = { 0  => "Green",                                                      #A hash to simulate the roulette wheel, holding all of the numbers and their respective colors
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

ball_placement = rand(36)                                                    #Spinning the wheel and generating a random number 1-36
wheel[ball_placement]                                                        #"Fixing" the number to one specific variable          
    
    
lines =File.open("ledger.txt").to_a                                            #Reader method for I/O
player_purse = lines.last.to_f                                                 #Setting purse to 100 for new user
if player_purse <= 0 
    social
    sleep(15)
    exit
end

puts "Welcome to the CoderAcademy Roulette Game"
puts "\n"
repeat = "y"

while repeat == "y"
    if player_purse <= 0 
        social
        sleep(15)
        exit
    end
      
puts "Your current balance is $#{player_purse}"                                  #Displaying the current player purse
puts "\n"
#*************************************************************************
count_lines =File.open("count.txt").to_a                                        # reader file count.txt
count = count_lines.last.to_f                                                   # Initializing count to the last value of count.txt
count += 1                                                                      # Add 1 to count

if count >= 10                                                                  # Test if count is greater than 10
    social
    File.open("count.txt", "a") do |line|                                       
        line.puts "\r" + "#{0}"
    end
else 
    File.open("count.txt", "a") do |line|                                        #Write method to the count file
        line.puts "#{count}"
    end
end
#*************************************************************************

puts "Below are the types of bets you can make"                                #Laying out the different betting types
puts "\n"

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
puts "\n"

puts "What type of bet would you like to make? Please select from the numbers above:"
bet_choice = gets.chomp.to_i                                                    #Selecting bet

while (bet_choice > 11) || (bet_choice .negative? == true) || (bet_choice == 0)    #Limits user input to valid bet type 1 to 11 (no string, negative values or empty spaces)
    puts "Your input is invalid."
    puts "Please re-enter a bet type number from 1 to 11."
    bet_choice = gets.chomp.to_i
 end
    
bet_hash = {1 => "Red or Black", 2 => "Odd or Even", 3 => "1-18", 4 => "19-36", 
            5=> "1st Dozen (1-12)", 6=> "2nd Dozen (13-24)", 7 => "3rd Dozen (25-36)", 
            8 => "Column 1", 9 => "Column 2", 10 => "Column 3", 11 => "Single number"}  # Hash for Confirmation to user which bet type they have selected


system "clear"                                                                          #Clears screen to maintain neatness

#*************************************************************************
puts "You have selected a '#{bet_hash[bet_choice]}' type bet"                               #Confirms to user which bet type they have selected
puts "\n"
puts "You currently have #{player_purse}"                                                   #Display player purse
puts "\n"
puts "How much would you like to bet?"
bet_amount = gets.chomp.to_f                                                                #Initializes the bet amount
   
while (bet_amount > player_purse) || (bet_choice .negative? == true) || (bet_amount == 0)    #Limits user input to valid amount (no string, negative values or empty spaces)
    puts "The amount is invalid."
    puts "Please re-enter a value less than or equal to your purse."
    bet_amount = gets.chomp.to_f
 end
 
    puts "You're betting $#{bet_amount}"                                                        #Confirms how much user is betting

#*************************************************************************
case bet_choice
    when 1
        odds = 1                                                              
        puts "What color would you like to bet on?"                                             #Input for what color to bet on
        puts "Enter '1' for Red or '2' for Black"
        
        color_choice = gets.chomp.to_i
        color_hash = {1 => "Red", 2 => "Black"}

        while (color_choice > 2) || (color_choice .negative? == true) || (color_choice == 0)    #Limits user input to 1 or 2 (no string, negative values or empty spaces)
           puts "Your input is invalid. Please choose between '1' for Red or '2' for Black"
           color_choice = gets.chomp.to_i
        end

        if color_hash[color_choice]== wheel[ball_placement]                                       #If the color_choice is equal to the associated color of the random number generated (This is taken from the hash)
            player_purse = win_bet(ball_placement, wheel,bet_amount, odds, player_purse)   
        else 
            player_purse = lose_bet(ball_placement, wheel, bet_amount, player_purse)
       end

#*************************************************************************
    when 2
        odds = 1
                puts "Would you like to bet on odds or evens?"
                puts "Enter '1' for ODDS or '2' for EVENS"
                odd_even = gets.chomp.to_i                                               
                
                while (odd_even > 2) || (odd_even .negative? == true) || (odd_even == 0)    #Limits user input to 1 or 2 (no string, negative values or empty spaces)
                    puts "Your input is invalid. Please choose between '1' for ODDS or '2' for EVENS"
                    odd_even = gets.chomp.to_i
                end
                
                case odd_even
                when 2                                                                                   
                    if ball_placement == 0                                                          #Test for zero
                        player_purse = lose_bet(ball_placement, wheel, bet_amount, player_purse)
                    elsif (ball_placement %2 == 0)                                                  #Test for even
                        player_purse = win_bet(ball_placement, wheel,bet_amount, odds, player_purse)                                                            #Displays new player purse
                    else                                                                            #Odd
                        player_purse = lose_bet(ball_placement, wheel, bet_amount, player_purse)
                    end
                when 1 
                    if ball_placement == 0                                                          #Test for zero
                        player_purse = lose_bet(ball_placement, wheel, bet_amount, player_purse)
                    elsif (ball_placement %2 == 1)                                                  #Odd
                        player_purse = win_bet(ball_placement, wheel,bet_amount, odds, player_purse)   
                    else                                                                            #Test for even
                        player_purse = lose_bet(ball_placement, wheel, bet_amount, player_purse)
                    end
                else
                    player_purse = lose_bet(ball_placement, wheel, bet_amount, player_purse)
                end
#*************************************************************************
    when 3
        odds = 2
        if ball_placement <= 18 && ball_placement >= 1                                  #If ball placement 1-18 #2X payout
            player_purse = win_bet(ball_placement, wheel,bet_amount, odds, player_purse)   
        else
            player_purse = lose_bet(ball_placement, wheel, bet_amount, player_purse)
        end
 #*************************************************************************   
    when 4
        odds = 2
        if ball_placement <= 36 && ball_placement >= 19                                 #If ball placement 19-36 #2X payout
            player_purse = win_bet(ball_placement, wheel,bet_amount, odds, player_purse)   
        else
            player_purse = lose_bet(ball_placement, wheel, bet_amount, player_purse)
        end
#*************************************************************************        
    when 5
        odds = 2
        if ball_placement <= 12 && ball_placement >= 1                                   #If ball placement 1-12 #2X payout
            player_purse = win_bet(ball_placement, wheel,bet_amount, odds, player_purse)   
        else
            player_purse = lose_bet(ball_placement, wheel, bet_amount, player_purse)
        end
#*************************************************************************
    when 6
        odds = 2
        if ball_placement <= 24 && ball_placement >= 13                                  #If ball placement 13-24 #2X payout
            player_purse = win_bet(ball_placement, wheel,bet_amount, odds, player_purse)   
        else
            player_purse = lose_bet(ball_placement, wheel, bet_amount, player_purse)
        end
#************************************************************************
    when 7
        odds = 2 
        if ball_placement <= 36 && ball_placement >= 25                                  #If ball placement 25-36 #2X payout
            player_purse = win_bet(ball_placement, wheel,bet_amount, odds, player_purse)   
        else
            player_purse = lose_bet(ball_placement, wheel, bet_amount, player_purse)
        end
#************************************************************************
    when 8
        odds = 2 
        column_1 = [1,4,7,10,13,16,19,22,25,28,31,34]
        if column_1.include? ball_placement                                              #If ball placement is within 1 column #2X payout
            player_purse = win_bet(ball_placement, wheel,bet_amount, odds, player_purse)   
        else 
            player_purse = lose_bet(ball_placement, wheel, bet_amount, player_purse)
        end
    
#************************************************************************
    when 9
        odds = 2 
        column_2 = [2,5,8,11,14,17,20,23,26,29,32,35]
        if column_2.include? ball_placement                                               #If ball placement is within 2nd column #2X payout
            player_purse = win_bet(ball_placement, wheel,bet_amount, odds, player_purse)   
        else 
            player_purse = lose_bet(ball_placement, wheel, bet_amount, player_purse)
        end
#************************************************************************
    when 10
        odds = 2
        column_3 = [3,6,9,12,15,18,21,24,27,30,33,36]
        if column_3.include? ball_placement                                               #If ball placement is within 3rd column #2X payout
            player_purse = win_bet(ball_placement, wheel,bet_amount, odds, player_purse)   
        else 
            player_purse = lose_bet(ball_placement, wheel, bet_amount, player_purse)
        end
#************************************************************************
    when 11
        odds = 35
        puts "You're a rebel..." 
        bet_number = -1
 
        while (bet_number < 0) || (bet_number > 36)                                   #Limits user input to valid amount (no string, negative values or empty spaces)
            puts "Please enter a number from 0 to 36:"
            bet_number = gets.chomp
            begin
                bet_number = Integer(bet_number)
            rescue
                bet_number = -1
 
                puts "Incorrect input value."
                
            end
         end

        if bet_number == ball_placement                                                #If ball placement is exactly the same #35X payout
            player_purse = win_bet(ball_placement, wheel,bet_amount, odds, player_purse)   
            p player_purse
        else
            player_purse = lose_bet(ball_placement, wheel, bet_amount, player_purse)
        end

#************************************************************************        
end                                                                                     #End of case bet choice
#************************************************************************
#puts "The program is going to write #{player_purse} to the ledger" 

File.open("ledger.txt", "a") do |line|                                                         #Write method to the betting ledger
    line.puts "#{player_purse}"
end
#************************************************************************
puts "Would you like to play again? 'yes' = y , 'Exit' = any other key"                 #End of while loop
repeat = gets.chomp                                                                     #Repeat = y 
system "clear"                                                                          #System clear for neatness
end