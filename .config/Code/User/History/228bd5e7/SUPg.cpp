#include "sort.h"
#include <iostream>

std::vector<int> bubbleSort(std::vector<int> list) {
  
  int helper;

  for (int i = 0; i < list.size(); i++) {
    for(int j = 0; j < list.size() -1; j++) {
      if (list[j] > list [j+1]) {
        std::cout << list[j] << " ";
        helper = list[j];
        list[j] = list[j+1];
        list[j+1] = helper; 
      }
    }
  }
  return list;
}