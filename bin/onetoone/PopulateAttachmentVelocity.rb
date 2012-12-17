$:.unshift File.join(File.dirname(__FILE__), *%w[../.. lib])

require 'PopulateOneToOneVelocityStat'


PopulateOneToOneVelocityStat.new('onetooneattachment').execute('isdeleted = 0')
