# [2015-10-21] Challenge #237 [Intermediate] Heighmap of Boxes
# https://www.reddit.com/r/dailyprogrammer/comments/3pnd3t/20151021_challenge_237_intermediate_heighmap_of/
# Works as long as there is no overlapping

fs = require 'fs'

layers = []
layerTile = ['#', '=', '-', '.', ' ']

fs.readFile __dirname + '/input.txt', 'utf-8', (err, contents) ->
    chars = contents.split('\n').slice(1).map (line) -> line.split ''
    findLayers chars
    heightmap chars

findLayers = (lines) ->
    lines.forEach (line, row) ->
        inBox = false
        i = 0
        while i < line.length
            if line[i] is '+' and not existingBox [row, i]
                inBox = true
                start = i
            if inBox
                char = line[++i]
                if char is '+'
                    r = row
                    while inBox
                        char = lines[++r][i]
                        if char is '+'
                            layers.push [[row, start], [r, i]]
                            inBox = false
            else
                i++

existingBox = (pos) ->
    layers.length && layers.some (layer) ->
        [
            layer[0].toString(),
            layer[1].toString(),
            [layer[0][0], layer[1][1]].toString(),
            [layer[1][0], layer[0][1]].toString()
        ].indexOf(pos.toString()) > -1

containingBoxes = (pos) ->
    layers.filter (layer) ->
        pos[0] > layer[0][0] and pos[0] < layer[1][0] and pos[1] > layer[0][1] and pos[1] < layer[1][1]
    .length

heightmap = (lines) ->
    lines.forEach (line, r) ->
        i = 0
        console.log (
            line.map (char, i) ->
                if char is ' '
                    height = containingBoxes [r, i]
                    height = layerTile.length unless height < layerTile.length
                    layerTile[height - 1]
                else
                    char
            .join ''
        )
