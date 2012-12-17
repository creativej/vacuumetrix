$:.unshift File.join(File.dirname(__FILE__), *%w[.. conf])
$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])

require 'config'
require 'rubygems'
require 'mysql'
require 'date'
require 'Sendit'

class OneToOneVelocityStat
  def initialize(table, period = 86400)
    @table = table
    @period = period
  end

  def send(condition = nil)
    timecreated = last_midnight.to_i
    puts last_midnight
    mpath = metric_path
    mvalue = metric_value timecreated, condition
    mtimestamp = timecreated

    puts mpath + ' - ' + mvalue + ' - ' + DateTime.strptime(timecreated.to_s,'%s').to_s + '|' + mtimestamp.to_s
    Sendit mpath, mvalue, mtimestamp
  end

  def metric_value(timecreated, condition = nil)
    db = Mysql.new $statServer, $statUser, $statPwd, $statDb

    s_timecreated = timecreated - @period

    if condition.nil?
      condition = ''
    else
      condition = "AND #{condition}"
    end

    query = %{
      SELECT
        count(*) as total
      FROM #{@table}
      WHERE
        timecreated > #{s_timecreated}
        AND timecreated <= #{timecreated}
        #{condition}
    }

    rs = db.query query

    rs.fetch_row[0]
  end

  def last_midnight
    now = Time.now.utc
    Time.utc(now.year, now.month, now.day, 0, 0, 0, 0)
  end

  def metric_path
    "onetoone.#{@table}s.created.velocity"
  end
end
