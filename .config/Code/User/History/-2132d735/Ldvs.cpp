#include "VectorIterators.h"


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
