class Visitor
  def visit(entry)
    if entry.class.to_s == "Directory"
      visit_directory(entry)
    else
      visit_filee(entry)
    end
  end
end

class Element
  def accept(visitor)
  end
end

class Entry < Element
  attr_reader :name, :size

  def initialize(name, size)
    @name = name
    @size = size
  end

  def add
    raise "error by add"
  end

  def iterator
    raise "error by iterator"
  end

  def to_string
    "#{name}(#{size})"
  end
end

class Filee < Entry
  attr_reader :name, :size

  def initialize(name, size)
    @name = name
    @size = size
  end

  def accept(visitor)
    visitor.visit(self)
  end
end

class Directory < Entry
  attr_reader :name, :directory
  def initialize(name)
    @name = name
    @directory = []
  end

  def size
    @size = 0
    @directory.each do |entry|
      @size += entry.size
    end

    @size
  end

  def add(entry)
    directory << entry
  end

  def accept(visitor)
    visitor.visit(self)
  end
end

class ListVisitor < Visitor
  def initialize
    @current_directory = ""
  end

  def visit_filee(filee)
    p "#{@current_directory}/#{filee.to_string}"
  end

  def visit_directory(directory)
    p "#{@current_directory}/#{directory.to_string}"
    save_directory = @current_directory
    @current_directory = "#{@current_directory}/#{directory.name}"

    directory.directory.each do |entry|
      entry.accept(self)
    end
    
    @current_directory = save_directory
  end
end

class Main
  def main
    puts "Making root entries..."

    root_directory = Directory.new("root")
    bin_directory = Directory.new("bin")
    tmp_directory = Directory.new("tmp")
    usr_directory = Directory.new("usr")

    root_directory.add(bin_directory)
    root_directory.add(tmp_directory)
    root_directory.add(usr_directory)

    bin_directory.add(Filee.new("vi", 10000))
    bin_directory.add(Filee.new("latex", 20000))

    root_directory.accept(ListVisitor.new)
  end
end

Main.new.main