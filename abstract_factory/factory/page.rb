module Factory
  module Page
    def initialize()
      @content = []
    end

    def page(title, author)
      @title = title
      @author = author
    end

    def add(item)
      content << item
    end

    def output
      filename = @title + ".html"
      writer = FileWriter.new(filename)
      writer.write(make_html)
      write.close
      p "#{filename} を作成しました"
    rescue => e
      p e
    end

    make_html
  end
end