#\ -o 0.0.0.0 -p 4444
require 'rubygems'
require 'rack'
require './api/orders/orders.rb'

#use ActiveRecord::ConnectionAdapters::ConnectionManagement

 run API::Orders