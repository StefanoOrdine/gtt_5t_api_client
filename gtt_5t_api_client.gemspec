# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gtt_5t_api_client/version'

Gem::Specification.new do |spec|
  spec.name          = "gtt_5t_api_client"
  spec.version       = Gtt5tApiClient::VERSION
  spec.authors       = ["Stefano Ordine"]
  spec.email         = ["stefano.ordine@gmail.com"]

  spec.summary       = %q{Scraps data from 5t timetable portal.}
  spec.description   = %q{Scraps data from 5t timetable portal.}
  spec.homepage      = "https://github.com/StefanoOrdine/gtt_5t_api_client"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "rubyGems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", "~> 1.6.8"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "pry-nav", "~> 0.2"
  spec.add_development_dependency "pry-coolline", "~> 0.2"
  spec.add_development_dependency "webmock", "~> 2.3"
end
