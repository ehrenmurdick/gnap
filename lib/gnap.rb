require 'activesupport'
require 'base64'
require 'net/http'
require 'net/https'
require 'builder'
require 'hpricot'
require File.dirname(__FILE__) + "/activesupport/time_formats"
require File.dirname(__FILE__) + "/gnap/connection"
require File.dirname(__FILE__) + "/gnap/publisher"
require File.dirname(__FILE__) + "/gnap/notification_bucket"
require File.dirname(__FILE__) + "/gnap/notification"
require File.dirname(__FILE__) + "/gnap/filter"

module Gnap
  def self.new username = nil, password = nil
    if defined?(Configuration)
      Connection.new(Configuration)
    elsif username.present? && password.present?
      Connection.new({:username => username, :password => password})
    else
      raise ArgumentError, "No configuration defined, please pass in username and password"
    end
  end

  class << self
    class_eval do
      define_method(:configure) do |hash|
        ::Gnap::Configuration = hash
      end
    end
  end
end

