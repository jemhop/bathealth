#!/usr/bin/ruby

def put_bat_info(bat_path)
	output = `upower -i #{bat_path} | grep capacity`.gsub(/\s+/, "") 
	index = output.index(':')
	colour = ""
	text = ""
	percentage = output[index+1...-1].to_f

	#percentage = 100

	case percentage 
	when 1..15
		colour = "196"
		text = "Time for a new battery >:("
	when 16..25 
		colour = "202"
		text = "Go to power jail :("
	when 26..50 
		colour = "226"
		text = "Doin okay I guess :|"
	when 51..75
		colour = "76"
		text = "Lookin pretty good :)"
	when 76..100 
		colour = "46"	
		text = "Flawless faultless awesome cool >:D"
	end

	
	puts "\x1b[1mHealth: \x1b[38;5;#{colour}m#{percentage}%"
	puts "\x1b[7;38;5;#{colour}m#{text}"
end



bat_list = `upower -e`

bat_array = bat_list.split("\n")

bat_sel = '/org/freedesktop/UPower/devices/battery_BAT0'

if ARGV.length > 0 && ARGV[0] == '-a'
ARGV.clear

for i in 0..bat_array.size-1
	puts "\x1b[1m#{i+1}.)\x1b[0m #{bat_array[i]}"
end

input = Integer(gets)




if input > bat_array.size 		
	puts 'Invalid input'
	return
end

for i in 0..bat_array.size-1
	if i == input-1 
		bat_sel = bat_array[i]
	end
end
end

put_bat_info(bat_sel)


