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
    links = doc.css('img[class^="pinImg"]')

    # filter out all the fluff surrounding the links
    # and store results in array
    @pins = []

    links.each do |link| 
      link.attributes.each do |attribute|
        # first part of attribute is the name, 2nd is the Nokogori element
        if attribute[0] = 'src'
          @pins.push attribute[1]
          #puts attribute[1].css('src')
        end
      end
    end

  end
end

