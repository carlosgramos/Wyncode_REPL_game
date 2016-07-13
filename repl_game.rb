option = nil
# meele = nil
weapon = nil
crowbar = true

# chest_contents = ["crowbar"]
inventory = []

what_do = "What do you want to do?"
invalid = "\nThat is not a valid Option\n\n"


  puts "############################"
  puts "# JUST ANOTHER ZOMBIE GAME #"
  puts "############################"
  puts ""

  puts <<EOF
You hear chaos and screaming in the Streets!
Someone is outside banging on your Front Door!

EOF
until option == "Q"
  puts what_do
  puts <<EOF
Options:  [G]o outside to investigate.
          [L]ook around the Room.
          [Q]uit. Life is too hard.

EOF

  option = gets.chomp.upcase
  case option
  when "G", "GO OUTSIDE", "GO OUTSIDE TO INVESTIGATE"
    # if weapon == crowbar
    if inventory.include? "crowbar"
      puts "\nYou see a zombie!\n\n"
      puts what_do
      puts <<EOF
Options:  [Sw]ing your Crowbar.
          [St]ab the Zombie in the head with your Crowbar.
          [Q]uit. Life is too hard.
EOF
      option = gets.chomp.upcase
      case option
      when "SW", "SWING", "SWING YOUR CROWBAR"
        puts "\nYou hit the Zombie and it stumbles backwards.\n\n"
        puts what_do
        puts <<EOF
        Options:  [C]lose the Door.
                  [R]un past the Zombie.
                  [S]wing your Crowbar again.
                  [Q]uit. Life is too hard.
EOF
        option = gets.chomp.upcase
        case option
        when "C", "CLOSE", "CLOSE THE DOOR"
          puts "You are still alive, but so is the Zombie!"
        when "R", "RUN", "RUN PAST THE ZOMBIE" # case ok
          puts "\nYou try to run past the Zombie, but it bites you."
          puts "You are infected"
          puts "GAME OVER..."
          option = "Q"
        when "S", "SWING", "SWING YOUR CROWBAR AGAIN"
          puts "You knocked the Zombie down"  # Do something else after this
          puts "Thank you for trying the \"JUST ANOTHER ZOMBIE GAME\" Demo!"
          option = "Q"
        when "Q", "QUIT", "QUIT. LIFE IS TOO HARD." # case ok
          puts "\nThis life is too much."
          puts "You couldn\'t hack it."
          puts "GAME OVER..."
        else
          option = invalid # You did not react quick enough. The Zombie bit you.
        end

      when "ST", "STAB", "STAB THE ZOMBIE WITH YOUR CROWBAR"
        puts "\nYou killed the  Zombie!"
        puts "Thank you for trying the \"JUST ANOTHER ZOMBIE GAME\" Demo!"
        option = "Q"
      when "Q", "QUIT", "QUIT. LIFE IS TOO HARD."
        puts "\nThis life is too much."
        puts "You couldn\'t hack it."
        puts "GAME OVER..."
      else
        puts invalid
      end

    else
      puts <<EOF

You open the door and see a Zombie,
but have no way to defend yourself!
The Zombie eats your face!

GAME OVER...
EOF
    option = "Q"
    end
# end here -------
when "L", "LOOK AROUND THE ROOM"
      puts "\nYou see a Chest, a TV, and a Phone.\n\n"
      puts what_do
      puts <<EOF
Options:  [O]pen the Chest.
          [P]ick up the Phone.
          [T]urn on the TV.
          [Q]uit. Life is too hard.
EOF
      option = gets.chomp.upcase
      case option
      when "O", "CHEST", "OPEN THE CHEST"
        unless inventory.include? "crowbar"
          puts "\nYou open the Chest and find a Crowbar.\n\n" # <-- make opton to pick it up or leave it // Handgun

          #set var for ammo
          # weapon = crowbar
          chest_contents = ["crowbar"]
          chest_contents.delete("crowbar")
          inventory << "crowbar"
        else
          puts "\nThe Chest is empty.\n\n"
        end
      when "P", "PHONE", "PICK UP THE PHONE"
        puts "\nThe Phone line is dead...\n\n"
      when "T", "TV", "TURN ON THE TV"
        puts "\nYou turn on the news and see reports of a Zombie Outbreak!\n\n"
      when "Q", "QUIT", "QUIT. LIFE IS TOO HARD."
        puts "\nThis life is too much."
        puts "You couldn\'t hack it."
        puts "GAME OVER..."
      else
        puts invalid
      end
  when "Q", "QUIT", "QUIT. LIFE IS TOO HARD."
    puts "\nThis life is too much."
    puts "You couldn\'t hack it."
    puts "GAME OVER..."
  else
    puts invalid
    # puts "A prisoner punches you in the face."
    # puts "Prisoner: \"Quit messin' around.\""
  end
end
