let is_prime n =
    let rec no_divisors m =
      m * m > n || (n mod m != 0 && no_divisors (m + 1))
    in
      n >= 2 && no_divisors 2;;

Printf.printf "is_prime(5): %b    " (is_prime 5);;
Printf.printf "is_prime(42): %b    " (is_prime 42);;
Printf.printf "is_prime(9): %b    " (is_prime 9);;


