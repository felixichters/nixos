#ifndef VECTOR_ITERATORS_H
#define VECTOR_ITERATORS_H

#include "Vector.h" // Include the header file where Vector class is declared

// Forward declarations
class VectorIterator;
class ConstVectorIterator;

// Free functions for begin and end

VectorIterator begin(Vector& vec);
VectorIterator end(Vector& vec);

ConstVectorIterator cbegin(const Vector& vec);
ConstVectorIterator cend(const Vector& vec);

// Iterator classes

class VectorIterator {
public:
    VectorIterator(Vector& vec, int pos);
    VectorIterator& operator++();
    VectorIterator operator++(int);
    VectorIterator& operator--();
    VectorIterator operator--(int);
    double& operator*();
    bool operator!=(const VectorIterator& other) const;

private:
    Vector& vec;
    int pos;
};

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
};

#endif // VECTOR_ITERATORS_H
