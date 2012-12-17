$:.unshift File.join(File.dirname(__FILE__), *%w[../.. lib])

require 'OneToOneVelocityStat'

OneToOneVelocityStat.new('onetooneattachment').send('isdeleted = 0')

