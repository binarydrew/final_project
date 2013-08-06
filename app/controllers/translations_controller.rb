class TranslationsController < ApplicationController

def create
  	if logged_in?
  		@phrase = Phrase.find(params[:phrase_id])
    	@translation = @phrase.translations.build(phrase_params)
    	@translation.user_id = current_user.id

    	if @translation.save
      	redirect_to @phrase   	
    	else
  			redirect_to @translation.phrase 
      	flash[:notice] = "Please log in or create account first"
  		end
  	else
  		redirect_to @translation.phrase 
      flash[:notice] = "Please log in or create account first"
  	end
  end




private

	def phrase_params
    params.require(:translation).permit(:content, :user_id, :phrase_id)
  end

end