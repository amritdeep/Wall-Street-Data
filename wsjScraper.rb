require "open-uri"
require "nokogiri"
require "csv"	
require "pry"

# wsj_url = "http://www.wsj.com/"
# page = "Home_MDW_MDC"

# search_page = "#{wsj_url}"+ "?" + "#{page}"

url = "http://markets.wsj.com/?mod=Home_MDW_MDC"

# url = Nokogiri::HTML(open(wsj_url))
html = Nokogiri::HTML(open(url))
contentwide = html.xpath("//div[@class='contentwide']")

# marketsAtGlance = contentwide.css('.marketsAtGlance')
zonedModule = contentwide.css('.zonedModule')
# id = contentwide.css('#majorRegionalStockIndexes_Id')

array = []

zonedModule.each do |zone|
	tables = zone.css('table')
	tables.each do |table|
		table.css('caption').each {|c| puts c.text}
		row = table.css('tbody tr')
		row.each do |row|
			data = row.css('td')
			data.each do |data|
				# binding.pry
				t = data.text.strip
				# array << t
			end
		end
	end
end

puts array

# majorRegionalStockIndexes_Id

# html.xpath("//div[@class='contentwide']//[@class='marketsAtGlance']")

# For Zone
# zonedModule = html.xpath("//div[@class='zonedModule']")

# zonedModule.each do |zone|
# 	binding.pry

# end



# html.xpath("//div") do |html|
# 	puts "html"
# end





# search_page_url.xpath('//div[@class="MDCsectionHeader"]')

# 'div.fullwide.pagewide.navType-black.subType-unsubscribed'