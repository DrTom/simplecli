path = require 'path'
fs = require 'fs'

main = path.join(path.dirname(fs.realpathSync(__filename)),'../../')
lib = main + "lib/"

parser = require lib + "argparser"
printer = require lib + 'printer'
println = printer.println

testCase = require('nodeunit').testCase
 
module.exports = testCase(

  "the commands argument is given": (test) ->

    test.expect 1

    testfun = (argv) ->
      test.deepEqual argv, ["remaining argument"],
        "then the according callback with the remaining argument must be called"

    pargs =
      argv: ["mycommand", "remaining argument"]
      commands: [
        { command: "mycommand"
        , callback: (argv) -> testfun(argv)
        }
      ]

    parser.parse pargs

    test.done()



  "parsing options" : (test) ->

    test.expect 3

    opts =
    [ { short: 'a'
      , long: 'someoption'
      , description: 'just an option'
      , callback: -> test.ok true, "options a must be invoked"
      }
    , { short: 'v'
      , long: 'valuedoption'
      , description: 'just that has an value'
      , value : true
      , callback: (value) -> test.ok value is "XVAL", "options v with value XVAL must be invoked"
      }
    , { long: "longopt"
      , callback: () -> test.ok true, "a longopt has be called too"
      }
    ]

    parser.parse
      options: opts
      argv:
        [ "-a"
        , "-v"
        , "XVAL"
        , "--longopt"
        ]

    test.done()


)
