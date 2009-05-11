module Gnap
  class NotificationBucket
    attr_reader :activities

    def initialize xml
      @activities = (Hpricot(xml) / "activities activity").map {|a| Notification.new(a)}
    end

    def method_missing(msg, *args, &block)
      if @activities.respond_to?(msg)
        @activities.send(msg, *args, &block)
      else
        super
      end
    end
  end
end
