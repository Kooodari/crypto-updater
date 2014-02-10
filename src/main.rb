require 'json'
require 'open-uri'
require 'net/http'

require './timer.rb'
require './price.rb'
require './colors.rb'

change = Timer.new
update = Timer.new
textud = Timer.new

doge = Price.new

firstrun = true

while true do
	if update.difference ">= 5.0" or firstrun
		update.reset

		json = JSON.parse(open("http://www.coins-e.com/api/v2/markets/data/").read)
		price = json["markets"]["DOGE_BTC"]["marketstat"]["ltp"]

		doge.price = [
			price.to_f,
			firstrun ? price.to_f : nil,
			price
		]
		firstrun = false if firstrun

		change.reset if doge.changed?

		print doge.console_line(doge.changed?, json["systime"], change.difference.round)

		doge.price = [nil, price.to_f, nil]
	elsif textud.difference "> 0.3" and change.difference "> 0.3"
		textud.reset
		print doge.console_line(true, json["systime"], change.difference.round)
	end
end
