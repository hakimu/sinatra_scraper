require 'json'
require 'nokogiri'
require 'httparty'

class NprScraper

  def scrape_page
  	HTTParty.get('http://www.npr.org/programs/morning-edition/')
  end

  def parse_scraped_page
    Nokogiri::HTML(scrape_page)
  end

  def parse_artist
  	artist = []
  	parse_scraped_page.css('.song-meta-wrap').map do |a|
  		artist.push(a.css('.song-meta-artist').text)
  	end
  end

  def parse_song_title
  	song_title = []
  	parse_scraped_page.css('.song-meta-wrap').map do |a|
  		song_title.push(a.css('.song-meta-title').text)
  	end
  end

end

# puts NprScraper.new.parse_artist

# foo = NprScraper.new
# puts foo.parse_artist
# puts foo.parse_song_title




