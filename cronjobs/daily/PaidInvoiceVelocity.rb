$:.unshift File.join(File.dirname(__FILE__), *%w[../.. lib])

require 'OneToOneVelocityStat'

OneToOneVelocityStat.new('invoice', 'paid').send('status = "paid"')

