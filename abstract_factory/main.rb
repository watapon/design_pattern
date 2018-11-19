include Factory::Factory

class Main
  def initialize(args)
    if args.length != 1
      p "Usage: aaa"
      exit
    end

    def main
      factory = Factory.get_factory(args[0])

      asahi = factory.create_linkt("朝日新聞", "https://asashi.com")
      yomiuri = factory.create_linkt("読売新聞", "https://yomiuri.co.jp")

      us_yahoo = factory.create_linkt("Yahoo USA", "https://yahoo.com")
      jp_yahoo = factory.create_linkt("Yahoo Japan", "https://yahoo.co.jp")

      excite = factory.create_linkt("Excite", "https://excite.com")
      google = factory.create_linkt("Google", "https//google.com")

      traynews = factory.create_tray("新聞")
      traynews.add(asahi)
      traynews.add(yomiuri)

      trayyahoo = factory.create_tray("新聞")
      trayyahoo.add(us_yahoo)
      trayyahoo.add(jp_yahoo)

      traysearch = factory.create_tray("新聞")
      traysearch.add(trayyahoo)
      traysearch.add(excite)
      traysearch.add(google)

      page = factory.create_page("LinkPage", "結城　浩")
      page.add(traynews)
      page.add(traysearch)
      page
    end
  end
end
