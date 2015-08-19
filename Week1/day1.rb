contacts = []

user_input = "x"
#array of first names
first_names = ['larry', 'moe', 'curley']
last_names = ['howard', 'Howard', 'joe']
phone_numbers = ['123.456.0987','231.456.0987','321.456.0987']


#list all contacts

#create a new contacts

#delete a contact

#bonus: 
# Have an option to sort contact by first name
# Edit a contact
# store first name, last name, and phone number
input_options = ['new', 'delete', 'edit', 'list', 'exit']

def update
  puts 'contact first name?'
  first_name = gets.chomp

  puts 'contact last name?'
  last_name = gets.chomp
	
  puts 'contact phone number?'
  phone_number = gets.chomp

  if first_name.length > 1 && last_name.length > 1 && phone_number.length > 1
    first_names << first_name
    last_names << last_name
    phone_numbers << phone_number
  else
    puts "Contacts must have all fields filled out."
    puts "Please try again."
  end
end

def select_contact
end

def sort
  puts "by: first name, last name, or phone number?"
  input = gets.chomp

  if input == "first name"
    first_names.sort!
    puts first_names
  elsif input == "last name"
    last_names.sort!
    puts first_names
  elsif input == "phone number"
    phone_numbers.sort!
    puts phone_numbers
  else "input unrecognized, try again"
    sort
  end
end


while true
  puts 'Your input options are: '
  puts input_options

  user_input = gets.chomp
  
  case user_input
  when 'new'
    update

  when 'list'
    x = 0
    while x < first_names.length + 1
      puts "#{first_names[x]} #{last_names[x]} #{phone_numbers[x]}"
      x += 1
    end

  when 'exit'
    exit

  when 'edit'
    #  	select_contact

  when 'delete'
    #    select_contact
    puts "Who would you like to delete?"

    @x = 0
    while @x < first_names.length
      puts "#{(@x + 1)}. #{first_names[@x]} #{last_names[@x]}"
      @x += 1
    end

    input = gets.chomp.to_i
    input -= 1 
    puts input

    first_names.delete(input)		# I don't understand why this isn't working to delete the contact
    last_names.delete(input)
    phone_numbers.delete(input)

    puts "deleted"
  when 'sort'
    sort

  else
    puts 'I do not understand what you mean'
    puts "Please try again."
    puts
  end
end