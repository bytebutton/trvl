# -*- encoding: utf-8 -*-
# stub: parsley-rails 2.0.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "parsley-rails"
  s.version = "2.0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jiri Pospisil"]
  s.date = "2014-09-01"
  s.description = "Parsley.js bundled for Rails Asset Pipeline"
  s.email = ["mekishizufu@gmail.com"]
  s.homepage = "https://github.com/mekishizufu/parsley-rails"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Parsley.js bundled for Rails Asset Pipeline"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, [">= 3.0.0"])
    else
      s.add_dependency(%q<railties>, [">= 3.0.0"])
    end
  else
    s.add_dependency(%q<railties>, [">= 3.0.0"])
  end
end
