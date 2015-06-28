class StanceController < ApplicationController
    require 'open-uri'
    
	def get
		puts params[:rep] + ' ' + params[:issue]
        rep = params[:address]
        issue = params[:issue]
        url = "http://ontheissues.org/Senate/" + rep + ".htm";
        doc = Nokogiri::HTML(open(url))
        stance = doc.at_xpath('//ul[preceding::a[@id="' + issue + '"]]')
        puts 'got stance'
        
        render :text => {:msg => doc}
	end
end