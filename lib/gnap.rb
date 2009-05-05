require 'activesupport'
require 'base64'
require 'net/http'
require 'net/https'
require 'builder'
require File.dirname(__FILE__) + "/activesupport/time_formats"
require File.dirname(__FILE__) + "/gnap/connection"
require File.dirname(__FILE__) + "/gnap/publisher"
require File.dirname(__FILE__) + "/gnap/notification_bucket"
require File.dirname(__FILE__) + "/gnap/filter"

module Gnap
  def self.new username, password
    Connection.new({:username => username, :password => password})
  end
end

