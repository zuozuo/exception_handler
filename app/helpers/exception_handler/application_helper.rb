module ExceptionHandler
  module ApplicationHelper
		def method_missing(meth, *args, &blk)
			if meth =~ /(.*)_path/ && respond_to?(:main_app)
				main_app.send(meth, *args)
			else
				super(meth, *args, &blk)
			end
		end
  end
end
