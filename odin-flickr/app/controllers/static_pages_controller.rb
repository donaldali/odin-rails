class StaticPagesController < ApplicationController
	require 'flickraw'

	FlickRaw.api_key       = ENV["FLICKR_KEY"]
	FlickRaw.shared_secret = ENV["FLICKR_SECRET"]

	def home
		@id = params[:id]
	end
end
