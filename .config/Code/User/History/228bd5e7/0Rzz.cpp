#include <iostream>

int* bubble(int list[]) {
  std::cout << list[2];
  return list;
}

int main () {
  int list[5] = {1,2,3,4};
  int* list2 = bubble(list);
  std::cout << list2[2];
  return 0;
}