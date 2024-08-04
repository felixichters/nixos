#ifndef NTH_PRIME_CONSTEXPR_H
#define NTH_PRIME_CONSTEXPR_H

//#include "next_prime_constexpr.h"

constexpr int nth_prime(int N, int count = 1, int num = 2) {
    return (count == N) ? num : nth_prime(N, count + 1, next_prime(num + 1));
}

#endif
