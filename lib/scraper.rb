require 'json'
require 'nokogiri'
require 'pry'
require 'httparty'

class NprScraper

  def scrape_page
  	HTTParty.get('http://www.npr.org/programs/morning-edition/')
  end

  def parse_scraped_page
    Nokogiri::HTML(scrape_page)
  end

  def parse_artist
  	artists = []
  	parse_scraped_page.css('.song-meta-wrap').map do |a|
  		artists.push(a.css('.song-meta-artist').text)
  	end
  end

  def parse_song_title
  	song_titles = []
  	parse_scraped_page.css('.song-meta-wrap').map do |a|
  		song_titles.push(a.css('.song-meta-title').text)
  	end
  end

end

puts NprScraper.new.parse_artist.inspect
# puts NprScraper.new.parse_artist

# foo = NprScraper.new
# puts foo.parse_artist
# puts foo.parse_song_title




