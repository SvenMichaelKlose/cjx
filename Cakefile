fs = require 'fs'

{print} = require 'sys'
{spawn} = require 'child_process'

build = (callback) ->
  coffee = spawn 'coffee', ['-c', '-o', 'js', '_revision.coffee', 'client']
  coffee = spawn 'coffee', ['-c', '-o', 'examples/simple-list/', 'examples/simple-list/']
  coffee.stderr.on 'data', (data) -> process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) -> print data.toString()
  coffee.on 'exit', (code) -> callback?() if code is 0

task 'build', 'Build lib/ from src/', build
