{transform} = require './'


describe 'transform', ->
  beforeEach ->
    fn = (a) -> a + 1
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
      @handler null, 1

    it 'executes the callback with the extracted value at the given key', ->
      expect(@callback).to.have.been.calledOnce
      expect(@callback).to.have.been.calledWithExactly null, 2
