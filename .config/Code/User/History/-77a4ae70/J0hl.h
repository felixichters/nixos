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

    Iterator& operator++();

    Iterator& operator--();

    friend bool operator==(const Iterator& a, const Iterator& b);
    friend bool operator!=(const Iterator& a, const Iterator& b);

private:
    Vector& vec;
    int pos;
};

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

    ConstIterator& operator++();

    ConstIterator& operator--();

    friend bool operator==(const ConstIterator& a, const ConstIterator& b);
    friend bool operator!=(const ConstIterator& a, const ConstIterator& b);

private:
    const Vector& vec;
    int pos;
};

Iterator begin(Vector& vec);
Iterator end(Vector& vec);

ConstIterator cbegin(const Vector& vec);
ConstIterator cend(const Vector& vec);

#endif 
