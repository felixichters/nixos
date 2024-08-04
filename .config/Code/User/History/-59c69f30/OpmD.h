#ifndef NEXT_PRIME_H
#define NEXT_PRIME_H

#include "is_prime.h"

template<int N, bool B = is_prime<N>::value>
struct next_prime;

template<int N>
struct next_prime<N, true> {
    static const int value = N;
};

template<int N>
struct next_prime<N, false> {
    static const int value = next_prime<N + 1>::value;
};

#endif
