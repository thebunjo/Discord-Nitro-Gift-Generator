require 'net/http'
require 'uri'

$big_chars = ('A'..'Z').to_a.join("")
$low_chars = ('a'..'z').to_a.join("")
$numbers = (0..9).to_a.join("")

puts "Program started."

File.open("code.txt", "w") do |file|
  while true
    code = []

    16.times do
      case rand(3)
      when 0
        code << $big_chars.split('').sample
      when 1
        code << $low_chars.split('').sample
      when 2
        code << $numbers.split('').sample
      else
      end
    end

    created_code = code.join("")
    to_add = "https://discord.gift/#{created_code}"
    begin
      uri = URI.parse(to_add)
      response = Net::HTTP.get_response(uri)

      if response.code == '200'
        puts "Found"
        to_add2 = "https://discord.gift/#{created_code}\n"
        file.write(to_add2)
      else
        next
      end
    rescue Exception => e
      sleep(300)
      puts "sleeping 5 minute."
    end
  end
end
