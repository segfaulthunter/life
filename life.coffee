# Copyright (C) 2011 by Florian Mayer <florian.mayer@bitsrc.org>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

define(['utils/utils'],
(utils) ->
  neigh = [
    [0, 1], [0, -1], [1, 0], [1, 1],
    [1, -1], [-1, 0], [-1, 1], [-1, -1]
  ]

  class Field
    constructor: (@xsize, @ysize) ->
      @field = ((0 for i in [0...ysize]) for u in [0...xsize])
    getOrElse: (x, y, def=null) ->
      if x < 0 or x >= @xsize or y < 0 or y >= @ysize
        def
      else
        @field[x][y]
    get: (x, y) -> @field[x][y]
    set: (x, y, v=1) -> @field[x][y] = v
    unset: (x, y) -> @set(x, y, 0)
    getSet: ->
      ret = []
      for x in [0...@xsize]
        for y in [0...@ysize]
          if @field[x][y]
            ret.push([x, y])
      ret

  class Life
    constructor: (@field) ->
    neighbours: (x, y) ->
      utils.sum(
        @field.get(utils.mod(x + d[0], @field.xsize), utils.mod(y + d[1], @field.ysize)) for d in neigh
      )
    tick: ->
      newfield = new Field(@field.xsize, @field.ysize)
      for x in [0...@field.xsize]
        for y in [0...@field.ysize]
          if @field.get(x, y)
            n = @neighbours(x, y)
            if n == 2 or n == 3
              newfield.set(x, y)
          else if @neighbours(x, y) == 3
            newfield.set(x, y)
      @field = newfield

  return {Field: Field, Life: Life}
)
