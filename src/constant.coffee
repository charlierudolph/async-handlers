transform = require './transform'


constant = (value, callback) ->
  fn = -> value
  transform fn, callback


module.exports = constant
