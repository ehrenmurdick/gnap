module FixtureHelpers
  def fixture(name)
    File.read(File.dirname(__FILE__) + "/../fixtures/#{name}.xml")
  end
end
World(FixtureHelpers)
