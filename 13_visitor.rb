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
    "#{@name}(#{@size})"
  end
end

class Filee < Entry
  def initialize(name, size)
    @name = name
    @size = size
  end

  def accept(visitor)
    visitor.visit(self)
  end
end

class Directory < Entry
  def initialize(name)
    @name = name
    @directory = []
  end

  def size
    size = 0
    directory.each do |entry|
      size << entry.size
    end

    size
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
    p "#{@current_directory}/#{filee.name}"
  end

  def visit_directory(directory)
    p "#{@current_directory}/#{directory&.directory}"
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
    bin_directory = Directory.new("directory")
    tmp_directory = Directory.new("tmp")
    usr_directory = Directory.new("usr")

    root_directory.add(bin_directory)
    root_directory.add(tmp_directory)
    root_directory.add(usr_directory)

    bin_directory.add(Filee.new("vi", 10000))
    bin_directory.add(Filee.new("latex", 20000))

    root_directory.accept(ListVisitor.new)

    puts ""
    puts "Making user entries..."

    yuki = Directory.new("yuki")
    hanako = Directory.new("hanako")
    tomura = Directory.new("tomura")

    usr_directory.add(yuki)
    usr_directory.add(hanako)
    usr_directory.add(tomura)

    yuki.add(Filee.new("diary.html", 100))
    yuki.add(Filee.new("Composite.java", 200))

    hanako.add(Filee.new("memo.tex", 300))
    hanako.add(Filee.new("game.doc", 400))
    hanako.add(Filee.new("junk.mail", 500))

    root_directory.accept(ListVisitor.new)
  end
end

Main.new.main