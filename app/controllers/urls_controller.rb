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

    @links = doc.css('img')
   
 	# find all the pins
 	  #pin_identifier = '//img[@class="pinImg"]' 
	  #@link = doc.xpath(pin_identifier)
  end
end

