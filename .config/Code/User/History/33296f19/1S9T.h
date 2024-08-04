#ifndef NTH_PRIME_H
#define NTH_PRIME_H

#include "next_prime.h"

template<int N>
struct nth_prime {
    static const int value = next_prime<nth_prime<N - 1>::value + 1>::value;
};

template<>
struct nth_prime<1> {
    static const int value = 2;
};

#endif
