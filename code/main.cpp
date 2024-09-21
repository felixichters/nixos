#include <iostream>
#include "create-list.h"
#include "sort.h"

void printList(std::vector<int> list);

int main() {
  std::vector<int> list = generateRandomVector(1,10,0,10);
	std::vector<int> sorted_list;
	
	std::cout << "unsorted list:" << std::endl; 
  printList(list);
	
  sorted_list = bubbleSort(list);
	std::cout << "bubble sort:" << std::endl;
	printList(sorted_list);
	
	sorted_list = mergeSort(list);
	std::cout << "merge sort:" << std::endl;
	printList(sorted_list);

	sorted_list = insertionSort(list);
	std::cout << "insertion sort:" << std::endl;
	printList(sorted_list);

	return 0;
}

void printList(std::vector<int> list) {
  for (int i = 0; i < list.size(); ++i) {
    std::cout << list[i] << " ";
  }
  std::cout << std::endl;
}
