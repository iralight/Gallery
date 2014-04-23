 require 'net/http'
 require 'nokogiri'
 require 'open-uri'

class UrlsController < ApplicationController
  def gallery

  	sample_pinboard = 'http://www.pinterest.com/iralight83/accessories/'
  	# get the url we are interested in
  	uri = URI(sample_pinboard)
  	@result = Net::HTTP.get(uri)
  	#puts @result

  	# find <div class="hoverMask"> that contains the pins
  	# Get a Nokogiri::HTML::Document for the page we’re interested in...
	@doc = Nokogiri::HTML(@result)
	

  end
end
