require "open-uri"
require "nokogiri"
require "pry"

wsj_url = Nokogiri::HTML("http://www.wsj.com/")
puts "#{wsj_url}"