#!/usr/bin/env ruby
# By Resheph
# Website: https://www.postexplo.com/
# Contact: @ReshephTheGray

## Required Modules

## Constants
BANNER = <<-END_OF_STRING
  __  __ _  __               ___      _      _            
 |  \/  (_)/ _|__ _ _ _ ___ / __|__ _| |_ __| |_  ___ _ _ 
 | |\/| | |  _/ _` | '_/ -_) (__/ _` |  _/ _| ' \/ -_) '_|
 |_|  |_|_|_| \__,_|_| \___|\___\__,_|\__\__|_||_\___|_|  
                                                          
END_OF_STRING
BANNER.freeze

## Globals
file = ""
wait = 1
extension = "_card.mfd"
dumpfolder = "dumps/"
webroot = "/var/www/html/"
htmlfile = "dumps.htm"

def updatehtml(folder, web)
  outfile = File.open(web, 'w')
  outfile.puts '<html><body>'
  Dir.foreach(folder) do |entity|
    next if entity == "." or entity == ".."
    outfile.puts entity + '<br />'  if File.size(folder + entity) == 1024
  end
  outfile.puts '</body></html>'
  outfile.close
end

## Main
puts BANNER

loop do
  time = Time.new
  file = dumpfolder + time.strftime("%Y-%m-%d_%H.%M.%S") + extension
  value = %x( mfoc -O #{file} )
  if ($?.exitstatus == 0) then updatehtml(dumpfolder, webroot + htmlfile) end
  sleep(wait)
end

