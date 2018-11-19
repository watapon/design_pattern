module Factory
  module Tray extend Item
    def initialize
      @tray = []
    end

    def tray(caption)
      super(caption)
    end

    def add(item)
      @tray << item
    end
  end
end