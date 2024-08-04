#ifndef VECTOR_ITERATORS_H
#define VECTOR_ITERATORS_H

#include "Vector.h" // Include the header file where Vector class is declared

class ConstVectorIterator {
public:
    ConstVectorIterator(const Vector& vec, int pos);
    ConstVectorIterator& operator++();
    ConstVectorIterator operator++(int);
    ConstVectorIterator& operator--();
    ConstVectorIterator operator--(int);
    const double& operator*() const;
    bool operator!=(const ConstVectorIterator& other) const;

private:
    const Vector& vec;
    int pos;
    const double* current;  // Pointer to current element
};

ConstVectorIterator cbegin(const Vector& vec);
ConstVectorIterator cend(const Vector& vec);

#endif // VECTOR_ITERATORS_H
