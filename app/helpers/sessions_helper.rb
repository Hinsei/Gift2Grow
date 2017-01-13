module SessionsHelper
	def current_company
		if session[:company_id]
			@current_company ||= Company.find_by_id(session[:company_id])
		end
	end

	def login?
		!current_company.nil?
	end

	def admin?
		current_company.superadmin?
	end

end
