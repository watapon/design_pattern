class AbstractDisplay
  def open
  end

  def print
  end

  def close
  end

  def display
    open
    5.times do
      print
    end
    close
  end
end

class CharDisplay < AbstractDisplay
  attr_reader :char

  def initialize(char)
    @char = char
  end

  def open
    printf '<<'
  end

  def print
    printf char
  end

  def close
    puts '>>'
  end
end

class StringDisplay < AbstractDisplay
  def initialize(string)
    @string = string
    @width = print_size(string)
  end

  def open
    print_line
  end

  def print
    puts "|#{@string}|"
  end

  def close
    print_line
  end

  private

  def print_line
    printf '+'
    printf '-' * @width
    puts '+'
  end

  def print_size(string)
    string.each_char.map {|c| c.bytesize == 1 ? 1 : 2}.inject(:+)
  end
end

class Main
  def execute
    CharDisplay.new('H').display
    StringDisplay.new("Hello, World.").display
    StringDisplay.new("こんにちは。").display
  end
end

i = Main.new
i.execute
