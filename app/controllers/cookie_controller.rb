class CookieController < ApplicationController
	def create
		@cookie = Cookiejar.create(cookie: params[:cookie])
		render "yay.json.jbuilder", status: :created
	end

	def get
		offset = rand(Cookiejar.count)
		@cookie = Cookiejar.offset(offset).first
	
		render "cookie.json.jbuilder", status: :found
	end
end