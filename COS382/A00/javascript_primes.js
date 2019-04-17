function is_prime(n) {
    if (n <= 1) return false;
    for (let x = 2; x < Math.floor(Math.sqrt(n)+1); x++) {
        if (n % x === 0) return false;
    }
    return true;
}

function primes(a, b) {
    lst = [];
    for (let i = a; i <= b; i++) {
        if (is_prime(i)) lst.push(i);
    }
    //process.stdout.write("a:"+ a + " b:" + b + "\n");
    //process.stdout.write("primes: " + lst.toString()+"\n");
    return lst;
}

function prime_partitions(n, k, lst) {
    if (k === undefined) k = 1;
    if (lst === undefined) lst = [];
    if (n === 0) {
        for (let i = 0; i < lst.length; i++) {
                if (i !== 0) {
                    process.stdout.write(" + ");
                }
                process.stdout.write("" + lst[i]);
            }
        process.stdout.write("\n");
    }
    else if (n > k) {
        let lst_of_primes = primes(k + 1, n);
        for (let i = 0; i < lst_of_primes.length; i++) { // Itterate through all of the primes
            let p = lst_of_primes[i];
            //process.stdout.write(""+p+"\n");
            // Do a deep copy of lst
            let temp_list = Array.from(lst);
            temp_list.push(p);
            prime_partitions(n - p, p, temp_list);
        }
    }
    /*else{
        process.stdout.write("\nExited\n");
    }*/
}

console.log("JS Prime Partitions");

const readline = require('readline');
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question("Enter a number (non-number to quit): ", (inp) => {
    let n = parseInt(inp);
    prime_partitions(n);
    rl.close();
    if (inp < 0) {
        throw("");
    }
});




