#!/usr/bin/env ruby

require "date"
require "optparse"

def calendar(year, month)
  firstday = Date.new(year, month, 1)
  lastday = Date.new(year, month, -1)
  startday = firstday.wday

  puts "#{month}月 #{year}".center(20)
  puts "日 月 火 水 木 金 土"
  print "   " * startday
  (firstday..lastday).each do |day|
    print day.day.to_s.rjust(2) + " "
    puts if day.saturday?
  end
  puts
end

options = {}
opt = OptionParser.new
opt.on("-m MONTH", Integer, "月を指定") { |m| options[:month] = m }
opt.on("-y YEAR", Integer, "年を指定") { |y| options[:year] = y }

opt.parse!(ARGV)

month = options[:month] || Date.today.month
year = options[:year] || Date.today.year

calendar(year, month)
