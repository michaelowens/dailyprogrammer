# [2015-10-21] Challenge #237 [Intermediate] Heighmap of Boxes
# https://www.reddit.com/r/dailyprogrammer/comments/3pnd3t/20151021_challenge_237_intermediate_heighmap_of/
# Naive aproach: only works when don't go up and down several times on a line

fs = require 'fs'

layers = ['#', '=', '-', '.', ' ']

fs.readFile __dirname + '/input.txt', 'utf-8', (err, contents) -> contents.split('\n').slice(1).forEach heightmap

heightmap = (line) ->
    layer = -1
    totalLayers = (line.match(/[\+|\|]/g) || []).length / 2
    topReached = false
    console.log (
        line
        .split ''
        .map (char) ->
            if ['|', '+'].indexOf(char) > -1
                if not topReached then layer++
                else layer--
            topReached = true if layer is totalLayers - 1

            switch char
                when ' '
                    if layer > layers.length - 1
                        layers[layers.length - 1]
                    else
                        layers[layer]
                else 
                    char
        .join ''
    )
