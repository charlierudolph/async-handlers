prependUnlessPresent = (str, prefix) ->
  if str.indexOf(prefix) is -1
    [prefix, str].join ': '
  else
    str


prependToError = (prefix, callback) ->
  (err, args...) ->
    if err
      if err.message
        err.message = prependUnlessPresent err.message, prefix
      else
        err = prependUnlessPresent err, prefix
    callback err, args...


module.exports = prependToError
