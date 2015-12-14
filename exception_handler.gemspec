$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "exception_handler/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "exception_handler"
  s.version     = ExceptionHandler::VERSION
  s.authors     = ["zuozuo"]
  s.email       = ["zzhattzzh@126.com"]
  s.homepage    = "https://github.com/zuozuo/exception_handler"
	s.summary     = "rails exception handler and notifications"
	s.description = "exception handling pages and notifications"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  s.add_development_dependency "sqlite3"
end
