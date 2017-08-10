#!/usr/bin/env node

var movedFile = false;

if (["linux", "win32"].indexOf(process.platform) !== -1)
  return;

var fs = require('fs');
var path = require('path');

var src = path.join(__dirname, '..', 'compile.py');
var dst = path.join(__dirname, '..', 'binding.gyp');

fs.renameSync(src, dst);

movedFile = true;

var spawn = require('child_process').spawn;

var stdio = 'ignore';

if (process.env.V) {
  stdio = 'inherit';
}

var options = {
  cwd: path.join(__dirname, '..'),
  stdio: stdio
};

var child = spawn('node-gyp', [ 'rebuild' ], options);

child.on('error', function (err) {
  if (err.code === 'ENOENT') {
    console.error('cannot locate node-gyp');
  } else {
    console.error(err);
  }

  process.exit(0);
});

child.on('close', function(code, signal) {
  if ((code || signal) && process.env.V === undefined) {
    console.error('---------------');
    console.error('Building dtrace-provider failed with exit code %d and signal %d',
                  code, signal);
    console.error('re-run install with environment variable V set to see the build output');
    console.error('---------------');
  }
  process.exit(0);
});

process.on('exit', function() {
  if (movedFile)
    fs.renameSync(dst, src);
});
