# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "cinch-cleverbotredux"
  s.version     = "1.0"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Dorion Beaudin"]
  s.email       = ["dorionbeaudin@live.ca"]
  s.homepage    = "https://github.com/curiouslyExistential/cinch-cleverbotredux.git"
  s.summary     = %q{Provides a simple to use IRC <-> Cleverbot interface}
  s.description = %q{This plugin contains an interface to permit users to interact with Cleverbot. It also contains several admin-friendly functions, should the bot become annoying on a channel.}

  s.add_dependency("cinch", "~> 2.1.0")
  s.add_dependency("cleverbot", "~> 0.2.0")

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
end
