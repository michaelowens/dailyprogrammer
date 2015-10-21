// [2015-09-07] Challenge #213 [Easy] Cellular Automata: Rule 90
// https://www.reddit.com/r/dailyprogrammer/comments/3jz8tt/20150907_challenge_213_easy_cellular_automata/

var input = process.argv[2] || '00000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000',
    inputLength = input.length,
    chars = input.split('').map(function (i) { return +i; }),
    steps = +process.argv[3] || 15;

for (var i = 0; i <= steps; i++) {
    var line = '',
        newChars = [];

    for (var x = 0; x < inputLength; x++) {
        line += (chars[x] ? 'x' : ' ');
        newChars[x] = (chars[x-1] || 0) ^ (chars[x+1] || 0);
    }

    console.log(line);
    chars = newChars;
}
