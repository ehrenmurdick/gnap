module Gnap
  class Filter < Publisher
    def initialize config, publisher, name, rules = nil
      @publisher = publisher
      @filter = name
      @rules = rules.try(:symbolize_keys)
      super config, publisher
    end

    def add_rules! rules
      doc = Builder::XmlMarkup.new
      doc.instruct!
      doc.rules {
        rules_to_xml(doc, rules)
      }
      post(rules_path, doc.target!)
    end

    def add_rule! type, value
      add_rules!({type => value})
    end


    def to_xml
      return unless @rules
      fullData = @rules.delete(:fullData)
      postURL = @rules.delete(:postURL)
      doc = Builder::XmlMarkup.new
      doc.instruct!
      doc.filter(:name => @filter, :fullData => fullData || false) {
        if postURL
          doc.postURL(postURL)
        end
        rules_to_xml(doc, @rules)
      }
      doc.target!
    end

    def path
      "#{super}/filters/#{@filter}"
    end

    def rules_path
      "#{path}/rules.xml"
    end

    def to_s
      @filter
    end

    private

    def rules_to_xml doc, rules
      rules.keys.each do |key|
        [rules[key]].flatten.each do |value|
          doc.rule(value, :type => key)
        end
      end
    end
  end

end
