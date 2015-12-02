class CookieController < ApplicationController
	def create
		@cookie = Cookiejars.create(params[:cookie])
	end

	def get
		@cookie = Cookiejars.sample
		render "cookie.json.jbuilder", status: :ok
	end
end