$:.unshift File.join(File.dirname(__FILE__), *%w[../.. lib])

require 'OneToOneVelocityStat'

OneToOneVelocityStat.new('invoice', 86400).send('status = "paid"')

