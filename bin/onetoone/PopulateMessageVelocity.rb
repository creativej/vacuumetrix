$:.unshift File.join(File.dirname(__FILE__), *%w[../.. lib])

require 'PopulateOneToOneVelocityStat'


PopulateOneToOneVelocityStat.new('onetoonemessage').execute('isdeleted = 0')
