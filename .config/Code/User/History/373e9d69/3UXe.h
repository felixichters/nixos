#ifndef NEXT_PRIME_CONSTEXPR_H
#define NEXT_PRIME_CONSTEXPR_H

#include "is_prime_constexpr.h"

constexpr int next_prime(int N) {
    return is_prime(N, N - 1) ? N : next_prime(N + 1);
}

#endif
