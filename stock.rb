require "open-uri"
require "nokogiri"
require "csv"	
require "pry"

url = "http://markets.wsj.com/?mod=Home_MDW_MDC"
html = Nokogiri::HTML(open(url))

# Major US Stock Index
# stock_index = html.xpath("//div[@class='MDCsection']")
stock_index = html.xpath("//div[@id='majorRegionalStockIndexes_Id']")
# stock_index.css('MDCsectionHeader').css('.MDCsectionName')

CSV.open("stock.csv", "wb") do |csv|

	stock_index.each do |stock|
		# puts stock
		# heading = stock.css('table').css('caption').css('h3').text
		# time = stock.css('table').css('caption').css('span').text

		# For Today stock only
		today = stock.css('table').css('tbody').css('tr')
		today.each do |today|
			
			begin
				name = today.css('td')[0].text
				# For Today stock only
				today_current_stock = today.css('td')[1].text
				today_change_stock = today.css('td')[2].text
				today_change_percentage = today.css('td')[3].text

				csv << [name, today_current_stock, today_change_stock, today_change_percentage]
				
			rescue Exception => e
				
			end


		end

	end

end

