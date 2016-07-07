require 'minitest/autorun'
require 'minitest/rg'
require './lib/scraper'

class TestNprScraper < Minitest::Test

	def setup
    @url = "http://npr.og"
	end

	def test_url_exists
		assert_equal "http://npr.og", @url
	end

end