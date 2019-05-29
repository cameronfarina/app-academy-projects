# PHASE 2
def convert_to_int(str)
  begin 
    new_integer = Integer(str)
  rescue ArgumentError
    puts "Please provide an integer as a string."
  rescue TypeError
    puts "Please provide a string."
  end
  new_integer
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
    if FRUITS.include?(maybe_fruit)
      puts "OMG, thanks so much for the #{maybe_fruit}!"
    else 
      raise ArgumentError
    end
end

def feed_me_a_fruit
  begin 
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue ArgumentError
    if maybe_fruit == "coffee"
      puts "Thanks for the coffee, but please try again."
      retry
    else 
      puts "go away"
    end
  end
end  

class BestFriendError < ArgumentError
end

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise BestFriendError.new("name cannot be blank") if name.empty?
    raise BestFriendError.new("fav_pastime cannot be blank") if fav_pastime.empty?
    raise BestFriendError.new("yrs_known has to be at least 5") unless yrs_known >= 5
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


