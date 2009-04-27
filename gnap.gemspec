Gem::Specification.new do |s|
  s.name = "gnap"
  s.author = "Ehren Murdick"
  s.email = "ehren.murdick@gmail.com"
  s.version = "0.4.2"
  s.files = Dir.glob("lib/**/*.rb")
  s.require_paths = ["lib"]
  s.summary = "Gnap is a interface to the Gnip api"
  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<active_support>, [">= 2.3.2"])
    else
      s.add_dependency(%q<active_support>, [">= 2.3.2"])
    end
  else
    s.add_dependency(%q<active_support>, [">= 2.3.2"])
  end
end
