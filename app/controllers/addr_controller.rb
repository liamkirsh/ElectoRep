class AddrController < ApplicationController
	def submit
		puts params[:address]
		redirect_to root_url
	end
end