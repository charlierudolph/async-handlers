{transform} = require './'


describe 'transform', ->
  context 'invalid parameters', ->
    it 'throws when fn in undefined', ->
      expect(-> transform undefined, ->).to.throw 'fn is not a function'

    it 'throws when fn in not a function', ->
      expect(-> transform {}, ->).to.throw 'fn is not a function'

    it 'throws when callback in undefined', ->
      expect(-> transform (->)).to.throw 'callback is not a function'

    it 'throws when callback in not a function', ->
      expect(-> transform (->), {}).to.throw 'callback is not a function'


  context 'valid parameters', ->
    beforeEach ->
      fn = (a, b) -> a + b
      @callback = sinon.spy()
      @handler = transform fn, @callback

    context 'passed an error', ->
      beforeEach ->
        @handler 'error'

      it 'executes the callback with the error', ->
        expect(@callback).to.have.been.calledOnce
        expect(@callback).to.have.been.calledWithExactly 'error'

    context 'passed a result', ->
      beforeEach ->
        @handler null, 1, 2

      it 'executes the callback with the extracted value at the given key', ->
        expect(@callback).to.have.been.calledOnce
        expect(@callback).to.have.been.calledWithExactly null, 3
