$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])

require 'OneToOneVelocityStat'
require 'mysql'

class PopulateOneToOneVelocityStat
  def initialize(table, period = 86400)
    @table = table
    @period = period
    @db = Mysql.new $statServer, $statUser, $statPwd, $statDb
  end

  def execute(condition)
    now = Time.now.utc.to_i

    timecreated = first_timecreated

    velocity_stat = OneToOneVelocityStat.new @table, @period

    while timecreated <= now
      velocity_stat.send(condition, timecreated)
      timecreated += @period
    end
  end

  def first_timecreated
    timecreated 'ASC'
  end

  def timecreated(sort_type)
    Integer @db.query(
      "SELECT timecreated FROM #{@table} ORDER BY timecreated #{sort_type} LIMIT 1"
    ).fetch_row[0]
  end
end
