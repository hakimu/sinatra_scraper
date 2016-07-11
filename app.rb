require 'json'
require './song'
require './lib/scraper'
require 'shotgun'
require 'pry'
require 'sinatra'
require 'newrelic_rpm'

class NprBump < Sinatra::Base

  get '/' do
    @songs = Song.all
		erb :index
	end

end



