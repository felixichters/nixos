#include <iostream>
#include "nth_prime_constexpr.h"

int main() {
    for (int i = 1; i <= 10; ++i) {
        std::cout << "The " << i << "-th prime is: " << nth_prime(i) << std::endl;
    }
    return 0;
}
