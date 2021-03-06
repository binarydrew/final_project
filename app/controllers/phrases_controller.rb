class PhrasesController < ApplicationController

	def index
		@phrases = Phrase.all

	end

	def new
		@phrase = Phrase.new
		pt = Phrase.all + Translation.all
		@sort_pt = pt.sort_by{|s| s.created_at}.reverse
	end

  def create
  	if logged_in?
    	@phrase = Phrase.new(phrase_params)
    	@phrase.user_id = current_user.id
    	if @phrase.save
      	redirect_to @phrase
    	else      
      	redirect_to root_path
      	flash[:notice] = "Invalid input or two languages cannot be the same "
    	end
  	else
  		redirect_to root_path
      flash[:notice] = "Please log in or create account first"
  	end
  end

	def show
		@phrase = Phrase.find(params[:id])
		@parent = Translation.find(params[:parent]) if params[:parent]
		@translation = Translation.new
		@translation.content = @parent.content if params[:parent]
		@translations = @phrase.translations.where(parent_id: nil)
	end

	def update
    @phrase = Phrase.find(params[:id])

    if @phrase.update_attributes(phrase_params)
      redirect_to @phrase
      flash[:notice] = "User updated"
    else
      flash[:alert] = "Updating failed, please try again."
      render :new
    end
  end

  def edit
    @title = "Edit a User"
    @phrase = Phrase.find(params[:id])
  end

  


private

	def phrase_params
    params.require(:phrase).permit(:content, :posted_lang_id, :trans_lang_id)
  end

end

