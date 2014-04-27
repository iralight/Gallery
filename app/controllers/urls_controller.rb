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

  	# Get a Nokogiri::HTML::Document for the page we’re interested in...
	  doc = Nokogiri::HTML(@result)

    #@links = doc.css('img[class="pinImg"]')
    @links = doc.css('img[class^="pinImg"]')

  end
end

