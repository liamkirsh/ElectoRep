class AddrController < ApplicationController
    require 'open-uri'
    
	def submit
		puts params[:address]
        @address = params[:address]
        url = "https://www.googleapis.com/civicinfo/v2/representatives?address=" + @address + "&includeOffices=true&levels=country&roles=legislatorLowerBody&roles=legislatorUpperBody&fields=normalizedInput%2Cofficials&key=" + ENV["google_dev_key"]
        url = url.gsub(' ', '+')
        doc = Nokogiri::HTML(open(url))
        json = JSON.parse(doc)
        'json["officials"].each do |official|
            print official["name"] + "\n"
            print official["address"][0]["line1"] + "\n"
            print official["address"][0]["city"].titlecase + ", "\
              + official["address"][0]["state"] + " "\
              + official["address"][0]["zip"] + "\n"
            print official["phones"][0]
            #official["photoUrl"]
            print "\n\n"
        end'
        
        render :text => {:msg => json}
	end
end