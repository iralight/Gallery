 require 'net/http'
 require 'nokogiri'
 require 'open-uri'
 #require 'get_url'

class UrlsController < ApplicationController 
  def gallery
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

  def recursive_url(url)
    # keep getting the url until you get some results
    begin 
      uri = URI(url)
      @result = Net::HTTP.get(uri)
      puts "inside recursive"
    end while @result.length == 0

    return @result
  end

  def follow
    #@result = GetUrl
    @result = recursive_url params[:url]
    @pins = gallery
    respond_to do |format|
      format.js
    end
  end

end

