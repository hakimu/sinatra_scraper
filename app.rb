require 'json'
require 'nokogiri'
require 'httparty'
require './lib/scraper'
require 'sinatra'
require 'newrelic_rpm'

class NprBump < Sinatra::Base

	get '/' do
    @artist = NprScraper.new.parse_artist
    @title = NprScraper.new.parse_song_title
		erb :index
	end

end

