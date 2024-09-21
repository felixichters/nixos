#include "sort.h"

std::vector<int> merge(std::vector<int> left, std::vector<int> right) {
	std::vector<int> result;
	int i = 0, j = 0;

	while (i < left.size() && j < right.size()) {
		if (left[i] <= right[j]) {
			result.push_back(left[i]);
			i++; 
		}
		else {
			result.push_back(right[j]);
			j++;
		}
	}
	while(i < left.size()) {
		result.push_back(left[i]);
		i++;
	}
	while(j < right.size()) {
		result.push_back(right[j]);
		j++;
	}
	return result;
}

std::vector<int> mergeSort(std::vector<int> list) {
	if(list.size() <= 1) return list;
	
	size_t mid = list.size() / 2; 

	std::vector<int> left(list.begin(), list.begin()+mid);
	std::vector<int> right(list.begin()+mid, list.end());

	left = mergeSort(left);
	right = mergeSort(right);

	return merge(left,right);
}
