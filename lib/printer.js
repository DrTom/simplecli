var Sys, Util, blue, bold, gray, green, print, println, purple, red, reset;
Sys = require('sys');
Util = require('util');
bold = '\033[0;1m';
gray = '\033[1;30m';
blue = '\033[1;34m';
green = '\033[0;32m';
purple = '\033[0;35m';
red = '\033[0;31m';
reset = '\033[0m';
print = function() {
  return Array.prototype.slice.call(arguments).forEach(function(arg) {
    if (typeof arg === "string") {
      return Sys.print(" " + arg);
    } else if (typeof arg === "null") {
      return Sys.print(" null");
    } else {
      return Util.inspect(arg);
    }
  });
};
exports.print = print;
exports.puts = print;
println = function() {
  Array.prototype.slice.call(arguments).forEach(function(arg) {
    if (typeof arg === "string") {
      return Sys.print(" " + arg);
    } else if (arg === "null") {
      return Sys.print(" null");
    } else {
      return Sys.print(" " + (Util.inspect(arg)));
    }
  });
  return Sys.print("\n");
};
exports.println = println;