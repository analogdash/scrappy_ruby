require 'net/http'

url = "http://insert.url/here/and_the_image_prefix_"
url2 = ".jpg"

#x = 2

for x in 0..99 #only goes from 00 to 99
    bigurl = url + x.to_s.rjust(2,"0") + url2
    uri = URI.parse(bigurl)
    dat = Net::HTTP.get_response(uri)
    if dat.code == "200" #ignores 404s et al
        File.open(x.to_s.rjust(2,"0")+".jpg","wb") do |file|
            file.puts dat.body
        end
    end
end
