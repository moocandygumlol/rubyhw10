class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    private
        def is_login?
            return session[:logged_in] == true
        end

        def must_be_logged_in
            if is_login?
                return true
            else
                redirect_to main_login_path, notice: 'you must be login before accessing this page'
            end 
        end
end
