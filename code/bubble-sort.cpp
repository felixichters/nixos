#include "sort.h"
#include "plot.h"
#include <iostream>

std::vector<int> bubbleSort(std::vector<int> list) {
  
  int helper;

  for (int i = 0; i < list.size(); i++) {
    for(int j = 0; j < list.size() - i - 1 ; j++) {
      if (list[j] > list [j+1]) {
        helper = list[j];
        list[j] = list[j+1];
        list[j+1] = helper; 
      }
    }
  	//plotVector(list);
	}
  return list;
}
