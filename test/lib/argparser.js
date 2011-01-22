var fs, lib, main, parser, path, printer, println, testCase;
path = require('path');
fs = require('fs');
main = path.join(path.dirname(fs.realpathSync(__filename)), '../../');
lib = main + "lib/";
parser = require(lib + "argparser");
printer = require(lib + 'printer');
println = printer.println;
testCase = require('nodeunit').testCase;
module.exports = testCase({
  "the commands argument is given": function(test) {
    var pargs, testfun;
    test.expect(1);
    testfun = function(argv) {
      return test.deepEqual(argv, ["remaining argument"], "then the according callback with the remaining argument must be called");
    };
    pargs = {
      argv: ["mycommand", "remaining argument"],
      commands: [
        {
          command: "mycommand",
          callback: function(argv) {
            return testfun(argv);
          }
        }
      ]
    };
    parser.parse(pargs);
    return test.done();
  },
  "parsing options": function(test) {
    var opts;
    test.expect(3);
    opts = [
      {
        short: 'a',
        long: 'someoption',
        description: 'just an option',
        callback: function() {
          return test.ok(true, "options a must be invoked");
        }
      }, {
        short: 'v',
        long: 'valuedoption',
        description: 'just that has an value',
        value: true,
        callback: function(value) {
          return test.ok(value === "XVAL", "options v with value XVAL must be invoked");
        }
      }, {
        long: "longopt",
        callback: function() {
          return test.ok(true, "a longopt has be called too");
        }
      }
    ];
    parser.parse({
      options: opts,
      argv: ["-a", "-v", "XVAL", "--longopt"]
    });
    return test.done();
  }
});