module PhrasesHelper

	def feed_color(pt)
		if pt.class.name == "Phrase" && pt.translations.empty?
			return "panel panel-danger"	
		elsif pt.class.name == "Phrase" && ((Time.now - pt.translations.last.created_at)/60 /60) > 21
			return "panel panel-danger"	
		elsif pt.class.name == "Phrase"
			return "panel panel-success"
		else pt.class.name == "Translation"
			return "panel panel-warning"
		end
		

		
	end

	def created_updated(pt)
		if pt.class.name == "Translation"
			return "updated at"
		else
			return "created at"
		end
	end

	def time_calc(pt)
		a = (Time.now - pt.created_at) / 60 / 60
		if a > 24
			b = (a / 24).to_i
			return b.to_s + day_or_days(b)			
		else
			return a.round(0).to_s + " hours and " + ((a-(a.to_i))*60).to_i.to_s + " minutes ago"
		end
	end

	def day_or_days(b)
		if b < 1
			return " days ago"
		else
			return " day ago"
		end
	end

	def pt_link(pt)
		pt.class.name == "Translation" ? pt.phrase : pt
	end

	def has_children?(parent)
		!parent.children.empty?
	end

	def show_children(parent)
		parent.children
	end

end




