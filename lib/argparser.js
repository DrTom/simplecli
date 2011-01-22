var fs, lib, main, path, printer, println;
path = require('path');
fs = require('fs');
main = path.join(path.dirname(fs.realpathSync(__filename)), '../');
lib = main + "lib/";
printer = require(lib + 'printer');
println = printer.println;
exports.parse = function(pargs) {
  return (function() {
    var argv, command;
    argv = pargs.argv != null ? pargs.argv.slice(0) : process.argv.slice(2);
    if (pargs.commands != null) {
      command = argv[0];
      pargs.commands.forEach(function(cmd) {
        if (command === cmd.command) {
          return cmd.callback(argv.slice(1));
        }
      });
    }
    if (pargs.options != null) {
      return pargs.options.forEach(function(opt) {
        var arg, i, _ref, _results;
        _results = [];
        for (i = 0, _ref = argv.length - 1; (0 <= _ref ? i <= _ref : i >= _ref); (0 <= _ref ? i += 1 : i -= 1)) {
          arg = argv[i];
          _results.push((arg.match(/^-/)) && arg === ("-" + opt.short) || (arg.match(/^--/)) && arg === ("--" + opt.long) ? opt.value != null ? opt.callback(argv[i + 1]) : opt.callback() : void 0);
        }
        return _results;
      });
    }
  })();
};