$:.unshift File.join(File.dirname(__FILE__), *%w[../.. lib])

require 'PopulateOneToOneVelocityStat'


PopulateOneToOneVelocityStat.new('invoice', 'paid').execute('status = "paid"')
