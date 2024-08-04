#include <iostream>
#include "create-list.h"

int main() {
  std::vector<int> list = generateRandomVector(10,10,10,10);

  for (int i = 0; i = list.size(); i++) {
    std::cout << list[i] << " ";
  }

  for (const int& element : list) {
    std::cout << element << "";
  }
  return 0;
}