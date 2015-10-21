# [2015-09-14] Challenge #232 [Easy] Palindromes
# https://www.reddit.com/r/dailyprogrammer/comments/3kx6oh/20150914_challenge_232_easy_palindromes/

fs = require 'fs'

fs.readFile __dirname + '/input.txt', 'utf-8', (err, contents) ->
    palindrome contents.split('\n').slice(1).join ''

palindrome = (input) ->
    cleanInput = input.toLowerCase().replace /\W/g, ''
    reverse = cleanInput.split('').reverse().join ''
    console.log (if cleanInput is reverse then 'P' else 'Not a p') + 'alindrome'
