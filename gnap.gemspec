Gem::Specification.new do |s|
  s.name = "gnap"
  s.author = "Ehren Murdick"
  s.email = "ehren.murdick@gmail.com"
  s.version = "0.4.3"
  s.files = Dir.glob("lib/**/*.rb")
  s.require_paths = ["lib"]
  s.summary = "Gnap is a interface to the Gnip api"
  if s.respond_to? :specification_version
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0')
      s.add_runtime_dependency(%q<activesupport>, [">= 2.3.2"])
      s.add_runtime_dependency(%q<builder>, [">= 2.1.2"])
      s.add_runtime_dependency(%q<hpricot>, [">= 0.8.1"])
    else
      s.add_dependency(%q<activesupport>, [">= 2.3.2"])
      s.add_dependency(%q<builder>, [">= 2.1.2"])
      s.add_dependency(%q<hpricot>, [">= 0.8.1"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 2.3.2"])
    s.add_dependency(%q<builder>, [">= 2.1.2"])
    s.add_dependency(%q<hpricot>, [">= 0.8.1"])
  end
end
