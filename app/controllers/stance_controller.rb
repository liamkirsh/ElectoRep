class StanceController < ApplicationController
    require 'open-uri'
    include ActionView::Helpers::TextHelper
    
	def get
		puts params[:rep] + ' ' + params[:issue] + ' ' + params[:type]
        rep = params[:rep]
        issue = params[:issue]
        type = params[:type]
        url = "http://ontheissues.org/" + type + "/" + rep + ".htm";
        url = url.gsub(' ', '_')
        doc = Nokogiri::HTML(open(url))
        stance = doc.at_xpath('//ul[preceding::a[@id="' + issue + '"]]').inner_text
        stance = simple_format(stance)
        #stance = JSON.parse(doc)
        puts stance
        
        render :text => {:msg => stance}
	end
end