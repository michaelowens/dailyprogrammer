// [2015-08-31] Challenge #230 [Easy] JSON treasure hunt
// https://www.reddit.com/r/dailyprogrammer/comments/3j3pvm/20150831_challenge_230_easy_json_treasure_hunt/

var fs = require('fs'),
    searchQuery = process.argv[3] || 'dailyprogrammer';

if (process.argv.length < 3) {
    console.error('Argument required, e.g.: node hunt.js filename.json');
    process.exit(1);
}

fs.readFile(process.argv[2], 'utf-8', function (err, contents) {
    try {
        hunt(JSON.parse(contents));
    } catch (e) {
        console.log(e.stack);
    }
});

function hunt(tree, path) {
    path = path || '';

    for (var k in tree) {
        if (typeof tree[k] === 'object') {
            if (hunt(tree[k], path + (path ? ' -> ' : '') + k)) {
                return true;
            }
        } else if (tree[k] === searchQuery) {
            console.log(path + ' -> ' + k);
            return true;
        }
    }

    return false;
}