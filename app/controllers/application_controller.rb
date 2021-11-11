class ApplicationController < ActionController::Base
	helper_method :current_user

	def current_user
		if session[:user_id]
			user = User.find(session[:user_id])
		else
			nil
		end
	end

	def is_logged_in?

		if current_user
			true
		else
			redirect_to new_session_path, notice: 'Silahkan Login terlebih dahulu'
		end
	end

end
