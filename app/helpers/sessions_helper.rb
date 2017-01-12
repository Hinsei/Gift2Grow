module SessionsHelper
	def current_company
		if session[:company_id]
			@current_company ||= Company.find_by_id[:company_id]
		end
	end

	def login?
		!current_company.nil?
	end

end
