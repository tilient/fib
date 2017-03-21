function fib(n) {
    if (n < 3) {
        return 1;
    }
    return fib(n - 2) + fib(n - 1);
}
console.log(fib(44));
console.log(fib(45));
console.log(fib(46));
