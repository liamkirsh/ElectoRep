desc "Get representatives"
task :get_reps => :environment do
    require 'rubygems'
    require 'open-uri'

    url = "https://www.googleapis.com/civicinfo/v2/representatives?address=634 howard ave san francisco ca&includeOffices=true&levels=country&roles=legislatorLowerBody&roles=legislatorUpperBody&fields=normalizedInput%2Cofficials&key=".gsub(' ', '+') + ENV["google_dev_key"]
    doc = Nokogiri::HTML(open(url))
    json = JSON.parse(doc)
    json["officials"].each do |official|
        print official["name"] + "\n"
        print official["address"][0]["line1"] + "\n"
        print official["address"][0]["city"].titlecase + ", "\
          + official["address"][0]["state"] + " "\
          + official["address"][0]["zip"] + "\n"
        print official["phones"][0]
        #official["photoUrl"]
        print "\n\n"
        end
    
end
