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

def main_menu
  print "
  Cheat Sheet:
  0. Quit
  1. Command line
  2. Vim
  3. Git 
  4. Sublime Menu
  Choose and option: "
  input = gets.chomp
  if input == "0"   # Should be able to use the has to determine input
    exit
  elsif input == "1"
    command_line
  elsif input == "2"
    vim
  elsif input == "3"
    git
  elsif input == "4"
    sublime_menu
  else
    invalid
    main_menu
  end
end

def hashes # To be set later. All hashes can be set in the method and then called later as needed.
@command_line_menu = {
  '1' => ['mv', 'move', 'mv <filename> <destination folder>'],
  '2' => ['mkdir', 'make a new direcory', 'mkdir <new directory name>'],
  '3' => ['ls', 'list conteents of current directory', 'ls <options>'],
  '4' => ['ls', 'list conteents of current directory', 'ls <options>']
}

@vim_menu = {
  '1' => ['-h or -l', 'Move cursor left', 'Move cursor right'],
  '2' => ['-k or -j', 'Move cursor up', 'Move cursor down'],
  '3' => ['-i', 'Insert mode', ''],
  '4' => ['esc', 'Escape Insert mode',''],
  '5' => [':wq', 'write and quit vim',''],
  '6' => [':q', 'Quit vim without writing', '']
}

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
@git_menu = {
  '1' => ['mv', 'move', 'mv <filename> <destination folder>']
#  '2' => ['mkdir', 'make a new direcory', 'mkdir <new directory name>']
  #'3' => ['ls', 'list conteents of current directory', 'ls <options>']
}
@sublime_menu = {
  '1' => ['Cmd-Shft-D', 'Duplicate a line', ''],
  '2' => ['Cmd-] or Cmd-[', 'Indent a line Left', 'Indent a line Right'],
  '3' => ['Cmd-Ctrl-Up or Cmd-Ctrl-Down', 'Move an entire line up or down', '']
}
end


def print_menu(menu)    # I think this method needs to define set values for input!!!!
  menu.length.times do |choice_number|  # Going to need a way to quantify how manu menus to output.
    puts "#{(choice_number + 1).to_s}. #{menu[(choice_number + 1).to_s][0]} 
    - #{menu[(choice_number + 1).to_s][1]}
    - #{menu[(choice_number + 1).to_s][2]}"
  end
end


def command_line
  print "
  Command Line Cheat Sheet:
  0. Main Menu
  "
  print_menu(@command_line_menu)
  print"
  5. Search Command Line

  Choose and option: "
  input = gets.chomp
  if input == "0"
    main_menu
  elsif input == "1"
    puts `man mv`
    command_line
  elsif input == "2"
    puts `man mkdir`
    command_line
  elsif input == "3"
    puts `man ls`
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

  print_menu(@vim_menu)
  
  print "
  Vim Cheat Sheet:
  0. Main Menu
  1. Previous Menu
  2. Search Vim
  Choose and option: "
  
  input = gets.chomp
  if input == "0"
    main_menu
  elsif input == "1"
    command_line
  elsif input == "2"
    puts "What would you like to search?"
    input1 = gets.chomp
    puts `man vim #{input1}`
    vim
  else
    invalid
    vim
  end
end

def sublime_menu
  print_menu(@sublime_menu)
  main_menu
end


  

def git
  puts "Git a clue kid."
  print_menu(@git_menu)
  
  print "
  Git Cheat Sheet:
  0. Main Menu
  1. 
  2. Git man page search  
  3. Previous menu
  "
  input = gets.chomp
  if input == "0"
    main_menu
  elsif input == "1"
  elsif input == "2"
    puts "What would you like to search?"
    input1 = gets.chomp
    puts `man git #{input1}`
    git
  else
    invalid
    git
  end
  
end

def invalid
  puts "Input not recognized. Please only use provided options."
end
  
  
hashes
main_menu