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
			logger.error ''
			logger.error "-------------------------------Error Occured at: #{Time.now.to_s}-------------------------------------"
			logger.error ''
			logger.error e.to_s
			e.backtrace[0..10].each {|line| logger.error line}
			logger.error ''

			logger.error 'SESSION'
			logger.error session.to_hash
			logger.error ''

			logger.error 'CURRENT_USER'
			logger.error current_user.attributes.except('hashed_password', 'encrypted_password', 'reset_password_token')
			logger.error ''

			logger.error 'ENV'
			logger.error request.env
			logger.error ''

			logger.error "-------------------------------Error Ended at: #{Time.now.to_s}-------------------------------------"
			logger.error ''
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
		def render_unauthorized
			handle_unauthorized e
			respond_to do |f| 
				f.html{ render template: "exception_handler/errors/unauthorized", status: 401, layout: 'application' }
				f.js{ render template: "exception_handler/errors/unauthorized", status: 401 }
			end
		end
	end
end
