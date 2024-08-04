#ifndef ITERATOR_H
#define ITERATOR_H

#include "Vector.h"

class Iterator {
public:
    using iterator_category = std::forward_iterator_tag;
    using difference_type   = std::ptrdiff_t;
    using value_type        = double;
    using pointer           = double*;
    using reference         = double&;

    Iterator(Vector& vec, int pos);

    reference operator*() const;
    pointer operator->();

    // Pre-increment
    Iterator& operator++();

    // Pre-decrement
    Iterator& operator--();

    friend bool operator==(const Iterator& a, const Iterator& b);
    friend bool operator!=(const Iterator& a, const Iterator& b);

private:
    Vector& vec;
    int pos;
};

// ConstIterator class for const vectors
class ConstIterator {
public:
    using iterator_category = std::forward_iterator_tag;
    using difference_type   = std::ptrdiff_t;
    using value_type        = double;
    using pointer           = const double*;
    using reference         = const double&;

    ConstIterator(const Vector& vec, int pos);

    reference operator*() const;
    pointer operator->();

    // Pre-increment
    ConstIterator& operator++();

    // Pre-decrement
    ConstIterator& operator--();

    friend bool operator==(const ConstIterator& a, const ConstIterator& b);
    friend bool operator!=(const ConstIterator& a, const ConstIterator& b);

private:
    const Vector& vec;
    int pos;
};

// Free functions for non-const iterators
Iterator begin(Vector& vec);
Iterator end(Vector& vec);

// Free functions for const iterators
ConstIterator cbegin(const Vector& vec);
ConstIterator cend(const Vector& vec);

#endif // ITERATOR_H
