module Gnap
  class NotificationBucket
    attr_reader :activities
    delegate :[], :size, :to => :activities

    def initialize xml
      @activities = (Hpricot(xml) / "activities activity").map {|a| Notification.new(a)}
    end
  end
end
