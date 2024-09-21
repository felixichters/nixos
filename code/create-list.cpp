#include "create-list.h"
#include <random>

std::vector<int> generateRandomVector(int min_size, int max_size, int min_value, int max_value) {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> sizeDist(min_size, max_size);
    std::uniform_int_distribution<> valueDist(min_value, max_value);

    int size = sizeDist(gen);
    std::vector<int> vec(size);

    for (int& element : vec) {
        element = valueDist(gen);
    }

    return vec;
}
