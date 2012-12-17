$:.unshift File.join(File.dirname(__FILE__), *%w[../.. lib])

require 'OneToOneVelocityStat'

OneToOneVelocityStat.new('onetooneproject').send()
