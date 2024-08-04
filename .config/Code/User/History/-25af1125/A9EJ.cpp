#include <iostream>
#include "create-list.h"
#include "sort.h"

void printList(std::vector<int> list);

int main() {
  std::vector<int> list = generateRandomVector(0,10,0,10);
  
  for (const int& element : list) {
    std::cout << element << " ";
  }

  list = bubbleSort(list);

  for (const int& element : list) {
    std::cout << element << " ";
  }
  return 0;
}

void printList(std::vector<int> list) {
  for (int i = 0; i < list.size(); ++i) {
    std::cout << list[i] << " ";
  }
}