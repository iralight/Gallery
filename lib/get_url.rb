module GetUrl
	def get_url
		sample_pinboard = 'http://www.pinterest.com/iralight83/accessories/'
  		uri = URI(sample_pinboard)
  		@result = Net::HTTP.get(uri)
    	puts @result.inspect
	end
end