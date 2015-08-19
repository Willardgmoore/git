# Cheat Sheetk
# Pseudocode
#
# Create a Ruby program that will be able to display useful commands for the command line and vim.
#
#   When the program opens, the user should be prompted with a menu that looks similar to:
#
#     Cheat Sheet:
#       0. Quit
#       1. Command line
#       2. Vim
#     Choose and option:
#
#   If the user chooses 1, for example, they will be taken to another menu that will look similar to:
#
#     Command Line Cheat Sheet:
#       0. Main Menu
#       1. copy - cp - cp <source filename> <destination filename>
#       2. move - mv - mv <source filename> <destination directory>
#       3. make directory - mkdir - mkdir <directory name>
#
# Bonuses:
#
#   -Output man on sub menu
#
#   -Add search option in main menu that would run a man command for the search input

# puts `man #{cmd}`

def intro
  print "
  Cheat Sheet:
  0. Quit
  1. Command line
  2. Vim
  3. Git 
  Choose and option: "
  input = gets.chomp
  if input == "0"
    exit
  elsif input == "1"
    command_line
  elsif input == "2"
    vim
  elsif input == "3"
    git
  else
    invalid
    intro
  end
end

def command_line
  print "
  Command Line Cheat Sheet:
  0. Main Menu
  1. copy - cp - cp <source filename> <destination filename>
  2. move - mv - mv <source filename> <destination directory>
  3. make directory - mkdir - mkdir <directory name>
  4. Search Command Line
  Choose and option: "
  input = gets.chomp
  if input == "0"
    intro
  elsif input == "1"
    puts `man cp`
    command_line
  elsif input == "2"
    puts `man mv`
    command_line
  elsif input == "3"
    puts `man mkdir`
    command_line
  elsif input == "4"
    puts "What would you like to search?"
    input1 = gets.chomp
    puts `man #{input1}`
    command_line
  else
    invalid
    command_line
  end
end

def vim
  puts "We don't know what Vim is just yet. You should go back."
  puts "Information coming soon. Stay tuned. Or don't."
  
  print "
  Vim Cheat Sheet:
  0. Main Menu
  1. Previous Menu
  2. Search Vim
  Choose and option: "
  
  input = gets.chomp
  if input == "0"
    intro
  elsif input == "1"
    command_line
  elsif input == "2"
    puts "What would you like to search?"
    input1 = gets.chomp
    puts `man #{input1}`
    vim
  else
    invalid
    vim
  end
end


  
# Vim
#
#   move cursor left - h
#   move cursor right - l
#   move cursor up - k
#   move cursor down - j
#
#   insert mode - i
#   escape insert mode - esc
#
#   write and quit vim - :wq
#   quit vim without writing - :q
#

def git
  puts "Git a clue kid."
  
  print "
  Git Cheat Sheet:
  0. Search git commands
  1. git status help
  2. git install  
  3. Previous menu"
  input = gets.chomp
  
end

def invalid
puts "Input not recognized. Please only use provided options."
end
  
  

intro