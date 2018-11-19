module ListFactory
  class ListPage
    def initialize(title, author)
      super(title, author)
    end

    def make_html
      buffer = []
      buffer << "<html><head><title>#{title}</title></head>"
      buffer << "<body>"
      buffer << "<h1>#{title}</h1>"
      buffer << "<ul>"

      it = content.iterator
      while it.has_next
        item = it.next
        buffer << item.make_html
      end

      buffer << "</ul>"
      buffer << "<hr><address>#{author}</address>"
      buffer << "</body></html>"
    end
  end
end