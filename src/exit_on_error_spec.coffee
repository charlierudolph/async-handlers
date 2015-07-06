childProcess = require 'child_process'
clc = require 'cli-color'


describe 'exitOnError', ->
  before ->
    @setup = "asyncHandlers = require('#{__dirname}'); handler = asyncHandlers.exitOnError;"


  context 'passed an error', ->
    beforeEach (done) ->
      withError = "#{@setup} handler('error');"
      childProcess.exec "coffee -e \"#{withError}\"", (@err, @stdout, @stderr) => done()

    it 'errors with status code 1', ->
      expect(@err).to.exist
      expect(@err.code).to.eql 1

    it 'does not write to stdout', ->
      expect(@stdout).to.eql ''

    it 'logs the error in red to stderr', ->
      expect(@stderr).to.eql clc.red('error') + '\n'


  context 'not passed an error', ->
    beforeEach (done) ->
      withoutError = "#{@setup} handler();"
      childProcess.exec "coffee -e \"#{withoutError}\"", (@err, @stdout, @stderr) => done()

    it 'does not error', ->
      expect(@err).to.not.exist

    it 'does not write to stdout', ->
      expect(@stdout).to.eql ''

    it 'does not write to stderr', ->
      expect(@stderr).to.eql ''
