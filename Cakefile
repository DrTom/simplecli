ChildProcess = require 'child_process'
Sys = require 'sys'
Util   = require 'util'

spawn = ChildProcess.spawn
exec = ChildProcess.exec


spawnWithOutput = (name,options)->
  red   = '\033[0;31m'
  reset = '\033[0m'
  bold  = '\033[1m'
  proc = spawn name, options
  proc.stdout.on 'data', (data) ->
    Util.print name+": "+data
  proc.stderr.on 'data', (data) ->
    Util.print red+name+": "+data+reset
  proc.on 'exit', (code) ->
    console.log('child process exited with code ' + code)
  console.log('spawned child ' + bold + name + " " + options.join(" ") + reset + ' pid: ' + proc.pid)

task 'develop', 'develop CoffeeFiles, watch and compile online', () ->

  invoke 'continuous-build'

task 'build', '', () ->

  exec 'rm  lib/*js demo/lib/*js test/lib/*js '
  spawnWithOutput 'coffee', ['--bare','-o','lib/','-c', 'src/']
  spawnWithOutput 'coffee', ['--bare','-o','test/lib/','-c', 'test/src/']
  spawnWithOutput 'coffee', ['--bare','-o','demo/lib/','-c', 'demo/src/']

task 'continuous-build', '', () ->

  exec 'rm  lib/*js demo/lib/*js test/lib/*js '
  spawnWithOutput 'coffee', ['-w','--bare','-o','lib/','-c', 'src/']
  spawnWithOutput 'coffee', ['-w','--bare','-o','test/lib/','-c', 'test/src/']
  spawnWithOutput 'coffee', ['-w','--bare','-o','demo/lib/','-c', 'demo/src/']

 
task 'test','run the test suite', () ->

  exec 'nodeunit test/lib/',  (err,stdout,stderr) ->
    Util.print stdout
    Util.print stderr

task 'try', '', () ->
  exec "./bin/espresso dochash -f test/data/simpleApp.json  | awk '{print $2}'", (err,stdout,stderr)->
    Util.print stdout
    Util.print stderr
    

