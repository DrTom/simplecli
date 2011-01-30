path = require 'path'
fs = require 'fs'

maindir = path.join(path.dirname(fs.realpathSync(__filename)),'../../')
libdir = maindir + "lib/"
lib = libdir
testdir = maindir + "test/"
bindir = maindir + "bin/"
demo = maindir + "demo/lib/"

testCase = require('nodeunit').testCase


module.exports = testCase(

  "string buffer" : (test) ->

    test.expect 4

    sbuffer = require(lib + 'string').createStringBuffer()

    x100 = "1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890"
    sbuffer.append x100
    test.ok sbuffer.toString() is x100, "append a simple string"

    b2 = require(lib + 'string').createStringBuffer()
  
    xyz= "xyz"
    b2.append xyz
    test.ok b2.toString() is xyz, "second buffer"

    test.ok sbuffer.toString() is x100, "second buffer doesn't influence first"

    
    sbuffer.append x100
    test.ok sbuffer.toString() is x100 + x100, "resizing must be correct"


    test.done()

)


