class UrlsController < ApplicationController
  def gallery
  	require 'net/http'
  	uri = URI('http://www.pinterest.com/iralight83/accessories/')
  	@result = Net::HTTP.get(uri)
  	puts @result
  end
end
