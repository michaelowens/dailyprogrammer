# [2015-10-07] Challenge #235 [Intermediate] Scoring a Bowling Game
# https://www.reddit.com/r/dailyprogrammer/comments/3ntsni/20151007_challenge_235_intermediate_scoring_a/

fs = require 'fs'

fs.readFile __dirname + '/input.txt', 'utf-8', (err, contents) ->
    contents.split '\n'
        .forEach scoring

scoring = (line) ->
    console.log line
    total = 0
    throws = []
    scores = line
        .replace /\s+/g, ''
        .split ''
        .filter (score) -> score isnt ''
    lastThrow = line.split(' ').pop()
    fillBalls = switch
        when lastThrow.charAt(0) is 'X' then 2
        when lastThrow.charAt(1) is '/' then 1
        else 0

    scores
        .forEach (score, i) ->
            throws.push switch score
                when 'X' then 10
                when '-' then 0
                when '/' then 10 - throws[i - 1]
                else parseInt score
        
    scores.forEach (score, i) ->
        return if i >= scores.length - fillBalls
        total += throws[i]
        if score is '/' then total += throws[i + 1]
        if score is 'X' then total += throws[i + 1] + throws[i + 2]

    console.log total
