#!/usr/bin/ruby

def put_bat_info(bat_path, debug_perc)
	output = `upower -i #{bat_path} | grep capacity`.gsub(/\s+/, "") 
	index = output.index(':')
	colour = ""
	text = ""
	if debug_perc == -1
		percentage = output[index+1...-1].to_f
	else
		percentage = debug_perc
	end

	#percentage = 100

	case percentage 
	when 0..20
		colour = "196"
		text = "Time for a new battery >:("
	when 21..40 
		colour = "202"
		text = "Go to power jail :("
	when 41..60 
		colour = "226"
		text = "Doin okay I guess :|"
	when 61..80
		colour = "76"
		text = "Lookin pretty good :)"
	when 81..100 
		colour = "46"	
		text = "Flawless faultless awesome cool >:D"
	end

	
	puts "\x1b[1mHealth: \x1b[38;5;#{colour}m#{percentage}%"
	puts "\x1b[7;38;5;#{colour}m#{text}"
end

def get_power_choice()
	bat_sel = ''
	for i in 0..bat_array.size-1
		puts "\x1b[1m#{i+1}.)\x1b[0m #{bat_array[i]}"
	end

	input = Integer(gets)





	if input > bat_array.size 		
		puts 'Invalid input'
		return 'invalid'
	end
	
	for i in 0..bat_array.size-1
		if i == input-1 
			bat_sel = bat_array[i]
		end
	end

	return bat_sel
end

debug_perc = -1

bat_list = `upower -e`
bat_array = bat_list.split("\n")
bat_sel = '/org/freedesktop/UPower/devices/battery_BAT0'

if ARGV.length > 0

	if ARGV[0] == '-a'
		bat_sel = print_power_options
		puts bat_sel
	else
		debug_perc = ARGV[0].to_f
	end
	ARGV.clear
end

put_bat_info(bat_sel, debug_perc)

print "\x1b[0m"


