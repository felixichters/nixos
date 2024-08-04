#include <iostream>
#include "nth_prime.h"

int main() {
    std::cout << "The 1st prime is: " << nth_prime<1>::value << std::endl;
    std::cout << "The 2nd prime is: " << nth_prime<2>::value << std::endl;
    std::cout << "The 3rd prime is: " << nth_prime<3>::value << std::endl;
    std::cout << "The 4th prime is: " << nth_prime<4>::value << std::endl;
    std::cout << "The 5th prime is: " << nth_prime<5>::value << std::endl;
    std::cout << "The 6th prime is: " << nth_prime<6>::value << std::endl;
    std::cout << "The 7th prime is: " << nth_prime<7>::value << std::endl;
    std::cout << "The 8th prime is: " << nth_prime<8>::value << std::endl;
    std::cout << "The 9th prime is: " << nth_prime<9>::value << std::endl;
    std::cout << "The 10th prime is: " << nth_prime<10>::value << std::endl;

    return 0;
}

}
