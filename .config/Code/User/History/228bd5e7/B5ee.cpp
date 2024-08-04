#include <iostream>
#include "create-list.h"

std::vector<int> bubbleSort(std::vector<int> list) {
  
  int helper;

  for (i = 0; i < list.size(), i++) {
    for(j = 0, j < list.size(), j++) {
      if (list[j] > list [j+1]) {
        helper = list[j];
        list[j] = list[j+1];
        list[j+1] = helper; 
      }
    }
  }
  return list;
}