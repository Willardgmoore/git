def welcome
  print "
  Calculator,
  "
end

@total = "no"


def calc
  input = gets.chomp

  if input == "+" || input == "-" || input == "*" || input == "/"
    @operand = input
#    puts "Operand"
    calc
  else
    if @total == "no"
 #     puts "here1"
      @total = input.to_i
    else
  #    puts "here2"
      @number = input.to_i
    end
 #   puts "number"
  end


  if @operand == '+'
    @total += @number
    puts @total
  end
  if @operand == '-'
    @total -= @number
    puts @total
  end
  if @operand == '*'
    @total *= @number
    puts @total
  end
  if @operand == '/'
    @total /= @number
    puts @total
  end

  calc
end

def error
  puts "You did something wrong"
end

def run
  welcome
  calc
end
run