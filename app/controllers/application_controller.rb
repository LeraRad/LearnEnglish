require 'rubygems'
require 'excon'

class ApplicationController < ActionController::Base
  include DeviseWhitelist
end
