GARMIN_DIR="/home/jcll/GARMIN"

HISTORY_FILE=__dir__+"/"+"history.dat"

puts "[+] open download history"
history_file=File.open(HISTORY_FILE,'r')
history=history_file.readlines.map(&:chomp)

puts "[+] changing dir"
Dir.chdir(GARMIN_DIR)

# puts "[+] load runs"
# ret_code=system("garmin_save_runs")
# unless ret_code
#   puts "garmin_save_runs failed. Is it correctly installed ?"
# end

puts "[+] translating files to gpx format"
nb_translations=0
Dir.glob("**/*.gmn").each do |gmn|
  dir =File.dirname(gmn)
  base=File.basename(gmn,".gmn")
  gpx=dir+"/"+base+".gpx"
  unless File.exist?(gpx)
    puts " |--[+] generating #{gpx}"
    nb_translations+=1
    system("garmin_gpx #{gmn} > #{gpx}")
  end
end
puts " |--> number of new gpx files       : #{nb_translations}"

puts "[+] uploading to garmin connect"
# using Pyhton : https://github.com/La0/garmin-uploader
history_file=File.open(HISTORY_FILE,'a')
nb_uploads=0
Dir.glob("**/*.gpx").each do |gpx|
  dir =File.dirname(gpx)
  base=File.basename(gpx,".gpx")
  unless history.include?(gpx)
    puts " |--[+] uploading #{gpx}"
    nb_uploads+=1
    system("gupload -a 'uploaded' #{gpx}")
    puts " |--[+] updating history"
    history_file.puts gpx
  end
end
puts " |--> number of gpx fileds uploaded : #{nb_uploads}"
