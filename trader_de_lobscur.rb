require 'rubygems'
require 'nokogiri'   
require 'open-uri'

# on définit une fonction cryptocurrency_prices
def cryptocurrency_prices
i = 0
	until i == 180
	puts "Soit patient, tu vas connaitre le prix des cryptomonnaies !"
	
	hash_array = {} # on fait un hash
	array_price = [] # on fait un tableau des prix
	array_name = [] # on fait un tableau des noms
	pages = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	currency_name = pages.css (".currency-name-container") # on récupére le nom de la crypto avec l'inspecteur d'élément
	price = pages.css("a.price") # on récupére le prix de la crypto avec l'inspect d'élément
	price.each  do |price| 
		price_usd =  price['data-usd']
		array_price << price_usd
		end
		currency_name.each do |name_c|
			name_cur = name_c.text	
			array_name << name_cur
		end

puts Hash[array_name.zip(array_price)]
sleep(3600)
puts "##########################################"
puts " tour #{i}"
i += 1
	end
end 

cryptocurrency_prices