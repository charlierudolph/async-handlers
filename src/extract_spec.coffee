{extract} = require './'


describe 'extract', ->
  context 'invalid parameters', ->
    it 'throws when callback in undefined', ->
      expect(-> extract 'a').to.throw 'callback is not a function'

    it 'throws when callback in not a function', ->
      expect(-> extract 'a', {}).to.throw 'callback is not a function'


  context 'valid parameters', ->
    context 'passed an error', ->
      beforeEach ->
        @callback = sinon.spy()
        @handler = extract 'a', @callback
        @handler 'error'

      it 'executes the callback with the error', ->
        expect(@callback).to.have.been.calledOnce
        expect(@callback).to.have.been.calledWithExactly 'error'

    context 'passed an object', ->
      beforeEach ->
        @callback = sinon.spy()
        @handler = extract 'a', @callback
        @handler null, {a: 1}

      it 'executes the callback with the extracted value at the given key', ->
        expect(@callback).to.have.been.calledOnce
        expect(@callback).to.have.been.calledWithExactly null, 1

    context 'passed an array', ->
      beforeEach ->
        @callback = sinon.spy()
        @handler = extract 1, @callback
        @handler null, ['a', 'b', 'c']

      it 'executes the callback with the extracted value', ->
        expect(@callback).to.have.been.calledOnce
        expect(@callback).to.have.been.calledWithExactly null, 'b'
