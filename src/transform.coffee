extract = (fn, callback) ->
  (err, result) ->
    if err then return callback err
    callback null, fn(result)


module.exports = extract
