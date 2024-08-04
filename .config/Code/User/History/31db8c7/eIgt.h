#ifndef IS_PRIME_H
#define IS_PRIME_H

template<int P, int K = P - 1>
struct is_prime {
    static const bool value = (P % K != 0) && is_prime<P, K - 1>::value;
};

template<int P>
struct is_prime<P, 1> {
    static const bool value = true;
};

template<>
struct is_prime<1> {
    static const bool value = false;
};

#endif