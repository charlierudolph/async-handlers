extract = (fn, callback) ->
  throw Error 'fn is not a function' unless typeof fn is 'function'
  throw Error 'callback is not a function' unless typeof callback is 'function'
  (err, args...) ->
    if err then return callback err
    callback null, fn(args...)


module.exports = extract
