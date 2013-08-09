class VotesController < ApplicationController

	def create
		if logged_in?
			phrase = Phrase.find(params[:id])
			phrase.translations

			
			@vote = translation.votes.new(vote_params)
			@vote.user_id = current_user.id
			@vote.save
		else
			flash[:notice] = "Please log in or create account first"
		end
	end

	def destroy
	end


private
	
	def vote_params
    params.require(:vote).permit(:vote_value, :user_id, :translation_id)
  end

end

