module Gnap
  class Publisher < Connection
    PATH = "/gnip/publishers/%s"
    NOTIFICATION_PATH = "/notification/%s.xml"
    NEW_FILTER_PATH = "/filters.xml"

    def initialize config, name
      @publisher = name.to_s
      super config
    end

    def notification(time = "current")
      get(build_notification_path(time))
    end

    def filter name
      Filter.new(@config, @publisher, name)
    end

    def create_filter! name, rules
      data = Filter.new(@config, @publisher, name, rules).to_xml
      post(path + NEW_FILTER_PATH % @publisher, data)
    end

    def path
      PATH % @publisher
    end

    private
    def build_notification_path time
      time = time.to_s(:gnap) if Time === time
      path + NOTIFICATION_PATH % time
    end
  end
end