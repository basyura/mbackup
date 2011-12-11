#!ruby
#-*- coding: utf-8 -*-
require 'fileutils'

local  = File.expand_path('~/Music/iTunes/iTunes\ Media/Music')
remote = "/Volumes/Data-1/iTunes/iTunes\ Music2"

puts 'local  : ' + local
puts 'remote : ' + remote

count = 0

Dir.glob("#{local}/**/*") do |lpath|
  rpath = remote + lpath.sub(/^#{local}/, "")
  # check remote file
  next if File.exist?(rpath)
  # mkdir
  if File.directory?(lpath)
    FileUtils.mkdir_p(rpath)
    next
  end
  # cp file
  puts rpath.sub(/^#{remote}\//, "")
  FileUtils.cp(lpath, rpath)
end

puts "\n-- copied #{count} files --"
