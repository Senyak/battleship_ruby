
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "battleship/version"

Gem::Specification.new do |spec|
  spec.name          = "battleship"
  spec.version       = Battleship::VERSION
  spec.authors       = ["Senyak"]
  spec.email         = ["mselina@sfedu.ru"]

  spec.summary       = %q{This gem implements the battleship gameplay by entering commands through the console}
  spec.description   = %q{The gem was created as a task in the discipline "Programming paradigms and technologies" in order to get acquainted with the development of gems.
By itself, the gem represents the gameplay of a sea battle (according to Russian rules), where you play with a computer.
Commands are entered through the console, everything else depends on your luck. (... there are possibly bug... in the sense feature)}
  spec.homepage      = "https://github.com/Senyak/battleship_ruby.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/Senyak/battleship_ruby.git"
    spec.metadata["changelog_uri"] = "https://github.com/Senyak/battleship_ruby.git"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
