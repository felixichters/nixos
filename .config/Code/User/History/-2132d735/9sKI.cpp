#include "VectorIterator.h"

// VectorIterator implementation
VectorIterator::VectorIterator(Vector& vec, int pos) : vec(vec), pos(pos) {}

VectorIterator& VectorIterator::operator++() {
    ++pos;
    return *this;
}

VectorIterator VectorIterator::operator++(int) {
    VectorIterator tmp = *this;
    ++(*this);
    return tmp;
}

VectorIterator& VectorIterator::operator--() {
    --pos;
    return *this;
}

VectorIterator VectorIterator::operator--(int) {
    VectorIterator tmp = *this;
    --(*this);
    return tmp;
}

double& VectorIterator::operator*() {
    return vec[pos];
}

bool VectorIterator::operator!=(const VectorIterator& other) const {
    return pos != other.pos;
}

// ConstVectorIterator implementation
ConstVectorIterator::ConstVectorIterator(const Vector& vec, int pos) : vec(vec), pos(pos) {}

ConstVectorIterator& ConstVectorIterator::operator++() {
    ++pos;
    return *this;
}

ConstVectorIterator ConstVectorIterator::operator++(int) {
    ConstVectorIterator tmp = *this;
    ++(*this);
    return tmp;
}

ConstVectorIterator& ConstVectorIterator::operator--() {
    --pos;
    return *this;
}

ConstVectorIterator ConstVectorIterator::operator--(int) {
    ConstVectorIterator tmp = *this;
    --(*this);
    return tmp;
}

const double& ConstVectorIterator::operator*() const {
    return vec[pos];
}

bool ConstVectorIterator::operator!=(const ConstVectorIterator& other) const {
    return pos != other.pos;
}

// Free function definitions

VectorIterator begin(Vector& vec) {
    return VectorIterator(vec, 0);
}

VectorIterator end(Vector& vec) {
    return VectorIterator(vec, vec.size());
}

ConstVectorIterator cbegin(const Vector& vec) {
    return ConstVectorIterator(vec, 0);
}

ConstVectorIterator cend(const Vector& vec) {
    return ConstVectorIterator(vec, vec.size());
}
