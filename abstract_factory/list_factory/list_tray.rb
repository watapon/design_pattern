module ListFactory
  class ListTray
    def initialize(caption)
      super(caption)
    end

    def make_html
      buffer = []
      buffer << "<li>"
      buffer << "#{caption}"
      buffer << "<ul>"

      it = tray.iterator
      while it = has_next
        item = it.next
        buffer << item.make_html
      end

      buffer << "</ul>"
      buffer << "</li>"
    end
  end
end