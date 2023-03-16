const exec = require('child_process').exec;
const argv = require('optimist').argv;
var filePathA = argv._.join("\" \"");

// Execute a command
exec(`format.bat "${filePathA}"`, (err, stdout, stderr) => {
  if (err) {
    console.error(err);
    return;
  }
  console.log(stdout);
});