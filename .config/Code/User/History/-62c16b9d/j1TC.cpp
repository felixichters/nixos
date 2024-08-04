#include <iostream>
#include "nth_prime.h"

int main() {
    for (int i = 1; i <= 10; ++i) {
        std::cout << "The " << i << "-th prime is: " << nth_prime<i>::value << std::endl;
    }
    return 0;
}
