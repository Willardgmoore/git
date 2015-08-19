@first_names = ['Larry', 'Moe', 'Curley']
@last_names = ['Howard', 'Howard2', 'Joe']
@phone_numbers = ['123.456.0987','231.456.0987','321.456.0987']

# Core Methods

def create
  get_info
  save_contact
end

def read
  puts "Would you like them sorted? ('Y'/'N')"
 
  input = gets.chomp.downcase
  if input == "y"
    puts "yes"
    sort
  elsif input == "n"
    x = 0
    while x < @first_names.length
      puts "#{@first_names[x]} #{@last_names[x]} #{@phone_numbers[x]}"
      x += 1
    end
  else 
    puts "Input not recognized. Please use only 'Y' or 'N'."
    read
  end
end

def update
  select_contact # We want the array position
  get_info

  @first_names[@selected] = @first_name
  @last_names[@selected] = @last_name
  @phone_numbers[@selected] = @phone_number
end

def delete
  select_contact
  puts @selected    #
  @first_names.delete_at(@selected)
  @last_names.delete_at(@selected)
  @phone_numbers.delete_at(@selected)
  
  #
  x = 0
  while x < @first_names.length
    puts "#{@first_names[x]} #{@last_names[x]} #{@phone_numbers[x]}"
    x += 1
  end
  #Y
end

# Secondary methods

def select_contact  #needed for update and delete
  puts "Please enter the number to the left of the contact you would like to edit."
  
  x = 0
  while x < @first_names.length
    puts "#{(x + 1)} #{@first_names[x]} #{@last_names[x]} #{@phone_numbers[x]}"
    x += 1
  end
  
  input = gets.chomp.to_i
  puts "#{(x + 1)} #{@first_names[x]} #{@last_names[x]} #{@phone_numbers[x]}"
  input -= 1
  puts "Is this the one you wanted? ('Y'/'N')"
  puts " #{@first_names[input]} #{@last_names[input]} #{@phone_numbers[input]}"
  
  input1 = gets.chomp.downcase
  if input1 == 'y'
    @selected = input.to_i
  elsif input1 == 'n'
    select_contact
  else 
    puts "Input not recognized. Please use only 'Y' or 'N'."
    select_contact
  end
end

def get_info  # needed for create and update
  puts 'contact first name?'
  @first_name = gets.chomp.capitalize

  puts 'contact last name?'
  @last_name = gets.chomp.capitalize

  puts 'contact phone number?'
  @phone_number = gets.chomp

  if @first_name.length > 1 && @last_name.length > 1 && @phone_number.length > 1
    #puts "passed"
  else
    puts "Contacts must have all fields filled out."
    puts "Please try again."
    get_info
  end
end

def save_contact  # needed for create and update
  @first_names << @first_name
  @last_names << @last_name
  @phone_numbers << @phone_number
end

def start
  puts "Welcome to C.R.U.D Contact Manager"
  puts "Options are limited to: 'new', 'list', 'update', 'delete', and 'exit'"
end

def sort
  puts "by: first name, last name, or phone number?"
  input = gets.chomp.downcase
  
  sorted = [[@first_names],[@last_names],[@phone_numbers]]
  puts sorted
  
  # if input == "first name"
  #   @first_names.sort!
  #   puts @first_names
  # elsif input == "last name"
  #   @last_names.sort!
  #   puts @last_names
  # elsif input == "phone number"
  #   @phone_numbers.sort!
  #   puts phone_numbers
  # else
  #   puts "input unrecognized, try again"
  #   sort
  # end
end


# End of Methods

start
while true
  user_input = gets.chomp.downcase
  
  case user_input
  when 'new'
    create
  when 'list'
    read
  when 'update'
    update
  when 'delete'
    delete
  when 'exit'
    exit
  else
    puts "input unrecognized, try again"
    puts "Options are limited to: 'new', 'list', 'update', 'delete', and 'exit'"
  end
end


#list all contacts

#create a new contacts

#delete a contact

#bonus: 
# Have an option to sort contact by first name
# Edit a contact
# store first name, last name, and phone number