# -*- encoding: utf-8 -*-
# stub: activerecord-mysql-unsigned 0.1.3 ruby lib

Gem::Specification.new do |s|
  s.name = "activerecord-mysql-unsigned"
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["yo_waka"]
  s.date = "2014-06-29"
  s.description = "Add unsigned option to integer type for ActiveRecord's MySQL2 adapter"
  s.email = ["y.wakahara@gmail.com"]
  s.homepage = "https://github.com/waka/activerecord-mysql-unsigned"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Add unsigned option to integer type for ActiveRecord's MySQL2 adapter"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0.0"])
      s.add_development_dependency(%q<database_cleaner>, [">= 0"])
      s.add_runtime_dependency(%q<activesupport>, ["< 4.2", ">= 3.2"])
      s.add_runtime_dependency(%q<activerecord>, ["< 4.2", ">= 3.2"])
      s.add_runtime_dependency(%q<mysql2>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 3.0.0"])
      s.add_dependency(%q<database_cleaner>, [">= 0"])
      s.add_dependency(%q<activesupport>, ["< 4.2", ">= 3.2"])
      s.add_dependency(%q<activerecord>, ["< 4.2", ">= 3.2"])
      s.add_dependency(%q<mysql2>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 3.0.0"])
    s.add_dependency(%q<database_cleaner>, [">= 0"])
    s.add_dependency(%q<activesupport>, ["< 4.2", ">= 3.2"])
    s.add_dependency(%q<activerecord>, ["< 4.2", ">= 3.2"])
    s.add_dependency(%q<mysql2>, [">= 0"])
  end
end
