extract = (fn, callback) ->
  throw Error 'fn is not a function' unless typeof fn is 'function'
  throw Error 'callback is not a function' unless typeof callback is 'function'
  (err, result) ->
    if err then return callback err
    callback null, fn(result)


module.exports = extract
