module ApplicationHelper

	def flash_class(type)
		case object
		when :alert
			"alert-warning"
		when :notice
			"alert-success"
		else
			""	
		end
	end				
end
