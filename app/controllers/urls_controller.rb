 require 'net/http'
 require 'nokogiri'
 require 'open-uri'

class UrlsController < ApplicationController
  def gallery(url)
    #puts url
    #sample_pinboard = 'http://www.pinterest.com/iralight83/accessories/'
  	# get the url we are interested in
  	#uri = URI(sample_pinboard)
  	uri = URI(url)
    @result = Net::HTTP.get(uri)

    #puts @result.inspect

  	# Get a Nokogiri::HTML::Document for the page we’re interested in...
	  doc = Nokogiri::HTML(@result)

    # get only pins from the link
    @links = doc.css('img[class^="pinImg"]')

    # filter out all the fluff surrounding the links
    # and store results in array
    @pins = []

    @links.each do |link| 
      @pin = {}
      @pin[:src]=link.attr('src')
      @pin[:alt]=link.attr('alt')
      @pins.push @pin
    end
    @pins
  end

  def follow
    @pins = gallery params[:url]
    respond_to do |format|
      format.js
    end
  end

end

