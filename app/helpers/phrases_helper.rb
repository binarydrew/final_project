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

	def time_calc(pt)
		a = (Time.now - pt.created_at) / 60 / 60
		if a > 24
			return (a / 24).to_i.to_s + " days and " + ((a-(a/24).to_i)*24).to_i.to_s + " hours ago" 
		else
			return a.round(0).to_s + " hours and " + ((a-(a.to_i))*60).to_i.to_s + " minutes ago"
		end
	end

	def pt_link(pt)
		pt.class.name == "Translation" ? pt.phrase : pt
	end

end