#include "VectorIterators.h"

// ConstVectorIterator implementation
ConstVectorIterator::ConstVectorIterator(const Vector& vec, int pos)
    : vec(vec), pos(pos) {
    current = &vec[pos];  // Initialize current to point to the current element
}

ConstVectorIterator& ConstVectorIterator::operator++() {
    ++pos;
    ++current;  // Move current to point to the next element
    return *this;
}

ConstVectorIterator ConstVectorIterator::operator++(int) {
    ConstVectorIterator tmp = *this;
    ++(*this);
    return tmp;
}

ConstVectorIterator& ConstVectorIterator::operator--() {
    --pos;
    --current;  // Move current to point to the previous element
    return *this;
}

ConstVectorIterator ConstVectorIterator::operator--(int) {
    ConstVectorIterator tmp = *this;
    --(*this);
    return tmp;
}

const double& ConstVectorIterator::operator*() const {
    return *current;  // Return reference to the current element
}

bool ConstVectorIterator::operator!=(const ConstVectorIterator& other) const {
    return pos != other.pos;  // Compare positions
}

// Free function implementations
ConstVectorIterator cbegin(const Vector& vec) {
    return ConstVectorIterator(vec, 0);  // Begin iterator at position 0
}

ConstVectorIterator cend(const Vector& vec) {
    return ConstVectorIterator(vec, vec.size());  // End iterator after the last element
}
