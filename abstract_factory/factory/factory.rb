module Factory
  module Factory
    def initialize
      create_link(caption, url)
      create_tray(caption)
      create_page(title, author)
    end

    def get_factory(classname)
      factory = const_get(classname).new
    rescue => e
      p e
    end
  end
end
