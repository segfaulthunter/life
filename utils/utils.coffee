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

define(['utils/underscore.string']
  ->
    sum = (arr, init=0) ->
      for elem in arr
        init += elem
      init
    max = (x, y) -> if x > y then x else y
    min = (x, y) -> if x < y then x else y
    mod = (x, y) -> if (m = x % y) < 0 then m + y else m
    rem = (x, y) -> x % y
    parseGet = (search) ->
      ret = {}
      for v in _.words(search[1...], '&')
        [k, v] = _.words(v, '=')
        ret[k] = v
      ret
    return {sum: sum, min: min, max: max, mod: mod, rem: rem, parseGet: parseGet}
)
