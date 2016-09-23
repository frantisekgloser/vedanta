#\ -o 0.0.0.0 -p 4444
require 'rubygems'
require 'rack'
require './order.rb'

#use ActiveRecord::ConnectionAdapters::ConnectionManagement

run API::Order