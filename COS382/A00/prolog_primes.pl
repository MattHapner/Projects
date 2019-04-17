/* :- debug. */

/* "Call" this predicate to print unique prime partitions for a number */
prime_partitions(N) :-
    format('Prime partitions: ~n'),
    prime_partitions_2(N, 1, []).

prime_partitions_2(N, K, L) :-
    (   N = 0 ->
        write_list(L),
        !
    ;
        (   N > K ->
            K1 is K + 1,
            primes_1(K1, N, PL),

            /* Recurse through the list of Primes */
            prime_partitions_loop(N, K, L, PL)
        ;
            !
        )
    ).

prime_partitions_loop(_, _, _, []) :-
    !.

prime_partitions_loop(N, K, L, [H|T]) :-
    P is H,
    NP is N - P,
    append(L,[P],TL),
    prime_partitions_2(NP, P, TL),
    prime_partitions_loop(N, K, L, T).

primes_1(A, B, LF) :-
    primes_2(A, B, [], LF).

primes_2(A, B, L, LF) :-
    /* Base case */
    (   A > B ->
        LF = L,
        !
    ;
        B1 is B - 1,
        (   is_prime(B) ->
            primes_2(A, B1, [B | L], LF)
        ;
            primes_2(A, B1, L, LF)
        )
    ).


/* Helpers */
write_list([]) :-
    format('~n'),
    !.
 
write_list([Head|Tail]) :-
    format('~w',[Head]),
    (   Tail = [_|_] ->
        format(' + '),
        write_list(Tail)
    ;
        /* write_list(Tail) would also work here */
        write_list([])
    ).

is_prime(2) :-
    !.

is_prime(N) :-
    N > 2,
    Max is floor(sqrt(N) + 1),
    is_prime_loop(N,2,Max).

is_prime_loop(N,Curr,Max) :-
    (   Curr > Max
    ->  true
    ;   Rem is mod(N,Curr),
        Rem =\= 0,
        Next is Curr + 1,
        is_prime_loop(N,Next,Max)
    ).


