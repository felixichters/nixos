#include <iostream>
#include "create-list.h"
#include "sort.h"

int main() {
  std::vector<int> list = generateRandomVector(0,10,0,10);
  
  list = bubbleSort(list);

  for (const int& element : list) {
    std::cout << element << "";
  }
  return 0;
}