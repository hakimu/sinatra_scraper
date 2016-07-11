require 'json'
require 'nokogiri'
require 'httparty'
require './song'
require './lib/scraper'
require 'shotgun'
require 'pry'
require 'data_mapper'
require 'dm-sqlite-adapter'
require 'sinatra'
require 'newrelic_rpm'

# DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/scraped_songs.db")

# class Song

#   include DataMapper::Resource
#   property :id, Serial
#   property :song_title, String
#   property :artist, String
#   property :created_at, DateTime
#   property :updated_at, DateTime

# end

# DataMapper.finalize.auto_upgrade!

class NprBump < Sinatra::Base

	get '/' do
    @artists = NprScraper.new.parse_artist[0]
    @titles = NprScraper.new.parse_song_title[0]
    @stuff = Song.all
		erb :index
	end


end



