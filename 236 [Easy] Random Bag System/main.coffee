# [2015-10-12] Challenge #236 [Easy] Random Bag System
# https://www.reddit.com/r/dailyprogrammer/comments/3ofsyb/20151012_challenge_236_easy_random_bag_system/

pieces = ['O', 'I', 'S', 'Z', 'L', 'J', 'T']
bag = []

tetromino = (i) ->
    i++ # ugly :(
    (while i -= 1
        bag = [].concat(pieces).sort(-> Math.round Math.random()) unless bag.length > 0
        bag.shift()
    ).join ''

validate = (input) ->
    valid = [].concat(pieces).sort().join ''
    input.match(/.{1,7}/g).filter((segment) ->
        valid.indexOf(segment.split('').sort().join('')) is -1
    ).length is 0

str = tetromino 50
console.log str, 'is', if validate(str) then 'valid' else 'invalid'
