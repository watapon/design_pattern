module Factory
  module Link extend Item
    def link(caption, url)
      super(caption)
      @url = url
    end
  end
end
