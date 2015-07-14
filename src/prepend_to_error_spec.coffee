{prependToError} = require './'


describe 'prependToError', ->
  beforeEach ->
    @callback = sinon.spy()
    @handler = prependToError 'prefix', @callback

  context 'no error', ->
    beforeEach ->
      @handler null, 1, 2

    it 'executes the callback with result', ->
      expect(@callback).to.have.been.calledOnce
      expect(@callback).to.have.been.calledWithExactly null, 1, 2

  context 'error string', ->
    beforeEach ->
      @handler 'an error occured'

    it 'executes the callback with the prefixed string', ->
      expect(@callback).to.have.been.calledOnce
      expect(@callback).to.have.been.calledWithExactly 'prefix: an error occured'

  context 'error object', ->
    beforeEach ->
      @error = Error 'an error occured'
      @handler @error

    it 'executes the callback with the error with a prefixed message', ->
      expect(@callback).to.have.been.calledOnce
      expect(@callback).to.have.been.calledWithExactly @error
      expect(@error.message).to.eql 'prefix: an error occured'
