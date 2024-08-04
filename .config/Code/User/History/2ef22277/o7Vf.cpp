#include <iostream>
#include <vector>
#include <random>

std::vector<int> generateRandomVector(int minSize, int maxSize, int minValue, int maxValue) {

    std::random_device rd;
    std::mt19937 gen(rd());
    
    std::uniform_int_distribution<> sizeDist(minSize, maxSize);
    std::uniform_int_distribution<> valueDist(minValue, maxValue);

    int size = sizeDist(gen);

    std::vector<int> vec(size);

    for (int& element : vec) {
        element = valueDist(gen);
    }
    
    return vec;
}

int main() {
    // Beispielaufruf der Funktion
    int minSize = 5;
    int maxSize = 15;
    int minValue = 1;
    int maxValue = 100;
    
    std::vector<int> randomVector = generateRandomVector(minSize, maxSize, minValue, maxValue);
    
    // Ausgabe des zufälligen Vektors
    for (const int& element : randomVector) {
        std::cout << element << " ";
    }
    std::cout << std::endl;
    
    return 0;
}
