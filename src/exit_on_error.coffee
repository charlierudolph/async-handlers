clc = require 'cli-color'


exitOnError = (err) ->
  if err
    console.error clc.red(err.toString())
    process.exit 1


module.exports = exitOnError
