$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "exception_handler/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "exception_handler"
  s.version     = ExceptionHandler::VERSION
  s.authors     = ["zuozuo"]
  s.email       = ["c_yzuo@groupon.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ExceptionHandler."
  s.description = "TODO: Description of ExceptionHandler."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5"

  s.add_development_dependency "sqlite3"
end
