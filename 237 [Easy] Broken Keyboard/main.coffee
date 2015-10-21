# [2015-10-19] Challenge #237 [Easy] Broken Keyboard
# https://www.reddit.com/r/dailyprogrammer/comments/3pcb3i/20151019_challenge_237_easy_broken_keyboard/

fs = require 'fs'

fs.readFile __dirname + '/input.txt', (err, input) ->
    throw new Error('Input file not found') if err

    fs.readFile '/usr/share/dict/words', (err, words) ->
        input.toString().split('\n').slice(1).forEach (keys) ->
            return if not keys

            console.log(
                words.toString()
                .match new RegExp '^[' + keys + ']+$', 'gmi'
                .sort (a, b) -> b.length - a.length
                .shift()
            )