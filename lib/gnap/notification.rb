module Gnap
  class Notification
    def initialize(data)
      @data = data
    end

    %w{url regardingUrl}.each do |meta|
      define_method(meta.underscore) do 
        (@data / meta.downcase).inner_text
      end
    end
  end
end
