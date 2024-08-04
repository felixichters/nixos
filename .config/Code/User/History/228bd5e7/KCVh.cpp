#include <iostream>

int main () {
  int list[5] = {1,2,3,4};
  int list* = bubble(list);
  return 0;
}

int* bubble(int list[]) {
  std::cout << list[2];
  return list;
}