// https://www.reddit.com/r/ProgrammingPrompts/comments/3iumvm/easymedium_write_a_program_that_translates_verbal/

var verbalMap = [
        'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten',
        'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen',
        'eighteen', 'nineteen', 'twenty', 'thirty', 'fourty', 'fifty', 'sixty',
        'seventy', 'eighty', 'ninety', 'hundred', 'thousand', 'million', 'billion'
    ],
    integerMap = [
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
        11, 12, 13, 14, 15, 16, 17,
        18, 19, 20, 30, 40, 50, 60,
        70, 80, 90, 100, 1000, 1000000, 1000000000
    ],
    input = 'two hundred and sixty';

if (process.argv.length > 3) {
    input = process.argv.slice(2).join(' ');
}

input = input.replace('-', ' ').replace(',', '').toLowerCase();

function verbalToInteger (str) {
    var queue = [],
        tokens = str.split(' '),
        value = 0,
        tmp = 0,
        negative = (tokens[0] === 'negative');

    for (var i in tokens) {
        var index = verbalMap.indexOf(tokens[i]);
        if (index > -1) {
            queue.push(integerMap[index]);
        }
    }

    for (var i in queue) {
        var token = queue[i];

        if (token >= 100) {
            value += tmp * token;
            tmp = 0;
        } else {
            tmp += token;
        }
    }

    value += tmp;

    if (negative) {
        value = -value;
    }

    return value;
}

console.log(verbalToInteger(input));