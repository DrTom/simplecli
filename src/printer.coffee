Sys = require 'sys'
Util = require 'util'

bold  = '\033[0;1m'
gray  = '\033[1;30m'
blue  = '\033[1;34m'
green = '\033[0;32m'
purple= '\033[0;35m'
red   = '\033[0;31m'
reset = '\033[0m'

print = () ->

  Array.prototype.slice.call(arguments).forEach (arg) ->

    if typeof arg is "string"
      Sys.print arg
    else if typeof arg is "function"
      Sys.print arg()
    else
      Util.inspect arg

exports.print = print



exports.puts = print

println = () ->

  Array.prototype.slice.call(arguments).forEach (arg) ->

    if typeof arg is "string"
      Sys.print arg
    else if typeof arg is "function"
      Sys.print arg()
    else
      Util.inspect arg

  Sys.print "\n"

exports.println = println

