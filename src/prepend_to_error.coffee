prependToError = (prefix, callback) ->
  (err, args...) ->
    if err
      if err.message
        err.message = [prefix, err.message].join ': '
      else
        err = [prefix, err].join ': '
    callback err, args...


module.exports = prependToError
