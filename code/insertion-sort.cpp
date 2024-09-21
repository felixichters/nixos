#include "sort.h"

std::vector<int> insertionSort(std::vector<int> list) {
	
	int head;
	int j;

	for(int i = 1; i < list.size(); i++) {
		head = list[i]; 
		j = i - 1;
		while(j >= 0 && list[j] > head) {
			list[j + 1] = list[j];
			j = j-1;
		}
		list[j+1] = head;
	}
	return list;
}
