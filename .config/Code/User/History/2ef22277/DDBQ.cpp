#include "create-list.h"
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
