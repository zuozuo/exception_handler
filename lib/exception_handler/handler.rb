module ExceptionHandler
  module Handler
    extend ActiveSupport::Concern

		module ClassMethods
			def rescue_and_handle_error
				rescue_from Exception, with: :render_error
				rescue_from ActiveRecord::RecordNotFound, with: :render_not_found   
				rescue_from CanCan::AccessDenied, with: :render_unauthorized if defined?(CanCan)
			end
		end

		def handle_server_error(e)
			logger.info JSON.pretty_generate(
			  EXCEPTION: e,
				BACKTRACE: e.backtrace[0..10],
				SESSION: session.to_hash,
				CURRENT_USER: (current_user.try(:attributes) || {}).except('hashed_password', 'encrypted_password', 'reset_password_token'),
				PARAMS: params,
				ENV: request.env
			)
		end

		def handle_not_found(e); end
		def handle_unauthorized(e); end

		#render 500 error 
		def render_error(e)
			handle_server_error e
			respond_to do |f| 
				f.html{ render template: "exception_handler/errors/server_error", status: 500 }
				f.js{ render template: "exception_handler/errors/server_error", status: 500 }
			end
		end

		#render 404 error 
		def render_not_found(e)
			handle_not_found e
			respond_to do |f| 
				f.html{ render template: "exception_handler/errors/not_found", status: 404 }
				f.js{ render template: "exception_handler/errors/not_found", status: 404 }
			end
		end

		# render 401 error
		def render_unauthorized(e)
			handle_unauthorized e
			respond_to do |f| 
				f.html{ render template: "exception_handler/errors/unauthorized", status: 401, layout: 'application' }
				f.js{ render template: "exception_handler/errors/unauthorized", status: 401 }
			end
		end

	end
end
