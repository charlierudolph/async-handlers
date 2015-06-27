transform = require './transform'


extract = (key, callback) ->
  fn = (result) -> result[key]
  transform fn, callback


module.exports = extract
