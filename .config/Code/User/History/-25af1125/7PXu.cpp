#include <iostream>
#include "create-list.h"

int main() {
  std::vector<int> list = generateRandomVector(10,10,10,10);

  for (i = 0; i <= list.size(); i++) {
    
  }

  for (const int& element : list) {
    std::cout << element << "";
  }
  return 0;
}