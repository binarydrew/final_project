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
			if a.round(0) < 1
				m = ((a-(a.to_i))*60).to_i
				return m.to_s + minutes_or_min(m)
			else
				hour_only = a.round(0)
				return hour_only.to_s + hour_or_hours(hour_only)
			end
		end
	end

	def day_or_days(b)
		if b > 1
			return " days ago"
		else
			return " day ago"
		end
	end

	def minutes_or_min(m)
		if m  < 1
			return " minute ago"
		else
			return " minutes ago"
		end
	end

	def hour_or_hours(hour_only)
		if hour_only < 1
			return " hour ago"
		else
			return " hours ago"
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




