###
  Very basic example.

  simplecli must be installed by npm to be called as shown in this file.
###
simplecli = require 'simplecli'

println = simplecli.printer.println

simplecli.argparser.parse(
  options : [
    { short: 'h'
    , long : 'hello'
    , callback : () -> println "Hello World!"
    }
  ]
  help: true
)
