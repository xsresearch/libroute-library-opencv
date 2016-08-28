#!/usr/bin/env ruby

require 'libroute/component'
require_relative 'handler'

Libroute::Component.run do |options|

  handler(options)
  
end

