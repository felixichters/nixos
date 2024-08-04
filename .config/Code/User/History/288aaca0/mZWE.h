#ifndef IS_PRIME_CONSTEXPR_H
#define IS_PRIME_CONSTEXPR_H

constexpr bool is_prime(int P, int K) {
    return (P < 2) ? false :
           (K == 1) ? true :
           (P % K != 0) && is_prime(P, K - 1);
}

#endif
