{constant} = require './'


describe 'constant', ->
  context 'invalid parameters', ->
    it 'throws when callback in undefined', ->
      expect(-> constant 'a').to.throw 'callback is not a function'

    it 'throws when callback in not a function', ->
      expect(-> constant 'a', {}).to.throw 'callback is not a function'


  context 'valid parameters', ->
    context 'passed an error', ->
      beforeEach ->
        @callback = sinon.spy()
        @handler = constant 'a', @callback
        @handler 'error'

      it 'executes the callback with the error', ->
        expect(@callback).to.have.been.calledOnce
        expect(@callback).to.have.been.calledWithExactly 'error'

    context 'not passed an error', ->
      beforeEach ->
        @callback = sinon.spy()
        @handler = constant 'a', @callback
        @handler null

      it 'executes the callback with the constant', ->
        expect(@callback).to.have.been.calledOnce
        expect(@callback).to.have.been.calledWithExactly null, 'a'
