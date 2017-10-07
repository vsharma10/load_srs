#!/usr/bin/env ruby
max_wt = 0.0
File.open("THER_FILE.txt").each do |line|
	line = line.chomp
	wt = line.split("\$")[8]
	#wt = line.split("\$")[18].to_f
	#max_wt = wt  if wt > max_wt 
	if wt != nil
		puts line if wt.length == 7
	end
end

#puts max_wt