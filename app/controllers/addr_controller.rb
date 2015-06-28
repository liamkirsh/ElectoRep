class AddrController < ApplicationController
    require 'open-uri'
    
	def submit
		puts params[:address]
        address = params[:address]
        url1 = "https://www.googleapis.com/civicinfo/v2/representatives?address="\
            + address + "&includeOffices=true&levels=country&roles=legislatorLowerBody&fields=normalizedInput%2Cofficials&key=" + ENV["google_dev_key"]
        url1 = url1.gsub(' ', '+')
        url2 = "https://www.googleapis.com/civicinfo/v2/representatives?address="\
            + address + "&includeOffices=true&levels=country&roles=legislatorUpperBody&fields=normalizedInput%2Cofficials&key=" + ENV["google_dev_key"]
        url2 = url2.gsub(' ', '+')
        lower = Nokogiri::HTML(open(url1))
        lower = JSON.parse(lower)
        upper = Nokogiri::HTML(open(url2))
        upper = JSON.parse(upper)
        puts lower
        upper["officials"] << lower["officials"][0]
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
        
        render :text => {:msg => upper}
	end
end