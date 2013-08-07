class TranslationsController < ApplicationController

def create
  	if logged_in?
  		@phrase = Phrase.find(params[:phrase_id])
    	@translation = @phrase.translations.build(translation_params)
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


def new

end

private

	def translation_params
		params.require(:translation).permit(:content, :parent_id)
	end

end