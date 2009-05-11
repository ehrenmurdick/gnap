module Gnap
  class Notification
    def initialize(data)
      @data = data
    end

    def method_missing msg, *args, &block
      (@data / msg.to_s.camelcase.downcase).inner_text
    end
  end
end
