module PhrasesHelper

def feed_color
	

	
end

def created_updated(pt)
	if pt.class.name == "Translation"
		return "updated at"
	else
		return "created at"
	end
end


end
