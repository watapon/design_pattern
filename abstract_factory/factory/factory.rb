module Factory
  module Factory
    def get_factory(classname)
      factory = const_get(classname).new
    rescue => e
      p e
    end

    def create_link(caption, url)
    end

    def create_tray(caption)
    end

    def create_page(title, author)
    end
  end
end
