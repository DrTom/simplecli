path = require 'path'
fs = require 'fs'

main = path.join(path.dirname(fs.realpathSync(__filename)),'../')
lib = main + "lib/"

printer = require lib + 'printer'
println = printer.println

exports.parse = (pargs) ->

  (() ->

    argv =
      if pargs.argv?
        pargs.argv.slice 0
      else
        process.argv.slice 2


    if pargs.commands?
      command = argv[0]

      pargs.commands.forEach (cmd)->
        if command is cmd.command
          cmd.callback(argv.slice 1)

    if pargs.options?
      pargs.options.forEach (opt)->
        for i in [0..argv.length-1]
          arg=argv[i]
          if (arg.match /^-/) and arg is ("-"+opt.short) or  (arg.match /^--/) and arg is ("--"+opt.long)
            if opt.value?
              opt.callback(argv[i+1])
            else
              opt.callback()

  )()

