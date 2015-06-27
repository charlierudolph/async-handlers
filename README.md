# Asynchronous handlers

Function factories for performing synchronous operations after asynchronous operations


#### transform(fn, callback)

Returns a function `(err, result)` that can be passed to an asynchronous function
that will pass the error through or pass `(null, fn(result))`

```js
f1 = function (callback) {
  asyncOperation(function(err, result) {
    if (err) {
      callback(err);
    } else {
      callback(null, syncOperation(result);
    }
  }
}

// is equivalent to

var asyncHandlers = require('async-handlers')

f1 = function (callback) {
  handler = asyncHandlers.transform(syncOperation, callback);
  asyncOperation(handler);
}
```


#### extract(key, callback)

Returns a function `(err, result)` that can be passed to an asynchronous function
that will pass the error through or pass `(null, result[key])`
