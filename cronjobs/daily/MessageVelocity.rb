$:.unshift File.join(File.dirname(__FILE__), *%w[../.. lib])

require 'OneToOneVelocityStat'

OneToOneVelocityStat.new('onetoonemessage').send('isdeleted = 0')

