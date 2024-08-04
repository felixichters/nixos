#include <iostream>
#include <

int main() {
    int size;
    // Erstellen und Füllen des Arrays
    int* array = createAndFillArray(size);

    // Ausgabe des ursprünglichen Arrays
    std::cout << "Ursprüngliches Array der Größe " << size << ":" << std::endl;
    for (int i = 0; i < size; ++i) {
        std::cout << array[i] << " ";
    }
    std::cout << std::endl;

    // Operation auf dem Array durchführen
    array = operateOnArray(array, size);

    // Ausgabe des veränderten Arrays
    std::cout << "Verändertes Array:" << std::endl;
    for (int i = 0; i < size; ++i) {
        std::cout << array[i] << " ";
    }
    std::cout << std::endl;

    // Freigeben des dynamisch erzeugten Arrays
    delete[] array;

    return 0;
}
