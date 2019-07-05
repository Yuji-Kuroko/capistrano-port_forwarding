
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "capistrano/port_forwarding/version"

Gem::Specification.new do |spec|
  spec.name          = "capistrano-port_forwarding"
  spec.version       = Capistrano::PortForwarding::VERSION
  spec.authors       = ["Yuji Kuroko"]
  spec.email         = [""]

  spec.summary       = %q{capistrano3 port forwarding settings.}
  spec.description   = %q{example: Able to deploy by repo on Github Enterprise.}
  spec.homepage      = "https://github.com/Yuji-Kuroko/capistrano-port_forwarding"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
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

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
