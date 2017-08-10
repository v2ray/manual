'use strict';

var exec = require('child_process').exec;
var execSync = require('child_process').execSync;
var fs = require('fs');
var access = fs.access;
var accessSync = fs.accessSync;
var constants = fs.constants || fs;

var isUsingWindows = process.platform == 'win32'

var fileNotExists = function(commandName, callback){
    access(commandName, constants.F_OK,
    function(err){
        callback(!err);
    });
};

var fileNotExistsSync = function(commandName){
    try{
        accessSync(commandName, constants.F_OK);
        return false;
    }catch(e){
        return true;
    }
};

var localExecutable = function(commandName, callback){
    access(commandName, constants.F_OK | constants.X_OK,
        function(err){
        callback(null, !err);
    });
};

var localExecutableSync = function(commandName){
    try{
        accessSync(commandName, constants.F_OK | constants.X_OK);
        return true;
    }catch(e){
        return false;
    }
}

var commandExistsUnix = function(commandName, callback) {

    fileNotExists(commandName, function(isFile){

        if(!isFile){
            var child = exec('command -v ' + commandName +
                  ' 2>/dev/null' +
                  ' && { echo >&1 \'' + commandName + ' found\'; exit 0; }',
                  function (error, stdout, stderr) {
                      callback(null, !!stdout);
                  });
            return;
        }

        localExecutable(commandName, callback);
    });

}

var commandExistsWindows = function(commandName, callback) {
  var child = exec('where ' + commandName,
    function (error) {
      if (error !== null){
        callback(null, false);
      } else {
        callback(null, true);
      }
    }
  )
}

var commandExistsUnixSync = function(commandName) {
  if(fileNotExistsSync(commandName)){
      try {
        var stdout = execSync('command -v ' + commandName +
              ' 2>/dev/null' +
              ' && { echo >&1 \'' + commandName + ' found\'; exit 0; }'
              );
        return !!stdout;
      } catch (error) {
        return false;
      }
  }

  return localExecutableSync(commandName);

}

var commandExistsWindowsSync = function(commandName, callback) {
  try {
      var stdout = execSync('where ' + commandName);
      return !!stdout;
  } catch (error) {
      return false;
  }
}

module.exports = function commandExists(commandName, callback) {
  if (!callback && typeof Promise !== 'undefined') {
    return new Promise(function(resolve, reject){
      commandExists(commandName, function(error, output){
        if (output) {
          resolve(commandName);
        } else {
          reject(error);
        }
      });
    });
  }
  if (isUsingWindows) {
    commandExistsWindows(commandName, callback);
  } else {
    commandExistsUnix(commandName, callback);
  }
};

module.exports.sync = function(commandName) {
  if (isUsingWindows) {
    return commandExistsWindowsSync(commandName);
  } else {
    return commandExistsUnixSync(commandName);
  }
};
