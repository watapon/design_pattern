require '../factory'

module ListFactory
  module ListFactory extend Factory::Factory
    def create_link(caption, url)
      ListLink.new(caption, url)
    end

    def create_tray(caption)
      ListTray.new(caption)
    end

    def create_page(title, author)
      ListPage.new(title, author)
    end
  end
end