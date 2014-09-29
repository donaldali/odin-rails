module FlickrHelper

	def user_photos(user_id, photo_count = 12)
		flickr.photos.search(user_id: user_id).to_a[0..(photo_count - 1)]
	end

	# def render_flickr_sidebar_widget(user_id, photo_count = 12, columns = 2)
	# 	begin
	# 		photos = user_photos(user_id, photo_count).in_groups_of(2)
	# 		render partial: '/flickr/sidebar_widget', locals: { photos: photos }
	# 	rescue Exception
	# 		render partial: '/flickr/unavailable'
	# 	end
	# end

	def render_flickr_widget(user_id, photo_count = 12, columns = 2)
		begin
			photos = user_photos(user_id, photo_count)
			render partial: '/flickr/widget', locals: { photos: photos }
		rescue Exception
			render partial: '/flickr/unavailable'
		end
	end
end
