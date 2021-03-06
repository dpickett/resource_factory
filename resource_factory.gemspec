# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{resource_factory}
  s.version = "0.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dan Pickett"]
  s.date = %q{2009-01-22}
  s.description = %q{}
  s.email = %q{josh@technicalpickles.com}
  s.files = ["README.textile", "VERSION.yml", "lib/resource_factory", "lib/resource_factory/resource_collection.rb", "lib/resource_factory/resource_factory.rb", "lib/resource_factory.rb", "test/lib", "test/lib/resource_collection_test.rb", "test/lib/resource_factory_test.rb", "test/test_helper.rb"]
  s.homepage = %q{http://github.com/dpickett/resource_factory}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Easily create ActiveResource XML responses}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
