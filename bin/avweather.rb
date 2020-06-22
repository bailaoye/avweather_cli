#!/usr/bin/env ruby

require_relative "../config/environment"
require_relative "../lib/avweather_cli.rb"

AvweatherCli::CLI.new.run