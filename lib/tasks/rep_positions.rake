desc "Fetch representative positions"
task :rep_positions => :environment do
    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'

    url = "http://ontheissues.org/Senate/Dianne_Feinstein.htm"
    doc = Nokogiri::HTML(open(url))
    #puts doc.at_css("title").text
    abortion = doc.at_xpath('//ul[preceding::a[@id="Drugs"]]')
    puts abortion
end
