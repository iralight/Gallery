 require 'net/http'
 require 'nokogiri'
 require 'open-uri'

class UrlsController < ApplicationController
  def gallery

  	sample_pinboard = 'http://www.pinterest.com/iralight83/accessories/'
  	# get the url we are interested in
  	uri = URI(sample_pinboard)
  	@result = Net::HTTP.get(uri)

  	# Get a Nokogiri::HTML::Document for the page we’re interested in...
	  doc = Nokogiri::HTML(@result)

    # get only pins from the link
    @links = doc.css('img[class^="pinImg"]')

    # filter out all the fluff surrounding the links
    # and store results in array
    @pins = []

    @links.each do |link| 
      @pin = []
      @pin.push link.attr('src')
      @pin.push link.attr('alt')
      @pins.push @pin
    end

  end
end

