# frozen_string_literal: true

require_relative "lib/dbip_util/version"

Gem::Specification.new do |spec|
  spec.name = "dbip_util"
  spec.version = DbipUtil::VERSION
  spec.authors = ["hmdne"]
  spec.email = ["54514036+hmdne@users.noreply.github.com"]

  spec.summary = "DbipUtil includes DB-IP Lite databases and a simple interface to them, based on `maxmind-db` gem"
  spec.homepage = "https://github.com/rbutils/dbip_util"
  spec.license = "MIT + CC-BY-4.0"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/rbutils/dbip_util"
  spec.metadata["source_code_uri"] = "https://github.com/rbutils/dbip_util/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.files += %i[country city asn].map { |f| "lib/dbip_util/db/dbip-#{f}-lite.mmdb" }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "maxmind-db", "~> 1.3"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata["rubygems_mfa_required"] = "true"
end
