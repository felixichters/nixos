#include <iostream>
#include <cstdlib> 
#include <ctime>  

int* createAndFillArray(int& size) {
    // Initialisieren des Zufallsgenerators
    std::srand(static_cast<unsigned int>(std::time(nullptr)));

    // Bestimmen der zufälligen Größe zwischen 10 und 30
    size = 10 + std::rand() % 21;

    // Dynamisches Erzeugen des Arrays
    int* array = new int[size];

    // Füllen des Arrays mit zufälligen Ganzzahlen
    for (int i = 0; i < size; ++i) {
        array[i] = std::rand();
    }

    return array;
}
