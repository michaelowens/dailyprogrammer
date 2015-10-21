# [2015-10-14] Challenge #236 [Intermediate] Fibonacci-ish Sequence
# https://www.reddit.com/r/dailyprogrammer/comments/3opin7/20151014_challenge_236_intermediate_fibonacciish/

fib = (n, f = 1) ->
    if n < 1
        0
    else if n < 2
        1 * f
    else
        fib(n - 1, f) + fib(n - 2, f)

find_lowest_fib = (x) ->
    factor = 1
    highest_factor = 0
    cache = [0]
    n = i = 1
    while n < x
        n = fib i++, factor
        cache.push n
        highest_factor = x / n if x / n % 1 is 0

    if n isnt x
        cache = cache
            .map (n) -> n * highest_factor
            .filter (n) -> n <= x

    cache.join ' '
    
console.log find_lowest_fib 0
console.log find_lowest_fib 578
console.log find_lowest_fib 123456789
