class WatchListsController < ApplicationContoller
	def create
		WatchList.create(movie_id: params[:movie_id], user_id: current_user.id)
	end
	def destroy
		WatchList.destroy(movie_id: params[:movie_id], user_id: current_user.id)
	end
end