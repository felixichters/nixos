#include <iostream>
#include <cstdlib> 
#include <ctime>  

int* createAndFillArray() {

    std::srand(static_cast<unsigned int>(std::time(nullptr)));

    size = 10 + std::rand() % 21;

    int* array = new int[size];

    for (int i = 0; i < size; ++i) {
        array[i] = std::rand();
    }

    return array;
}
