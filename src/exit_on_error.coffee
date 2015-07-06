clc = require 'cli-color'


exitOnError = (err) ->
  if err
    console.error clc.red(err)
    process.exit 1


module.exports = exitOnError
