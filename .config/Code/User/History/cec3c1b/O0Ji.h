#ifndef COMPOSITE_H
#define COMPOSITE_H

#include "Quadrature.h"

double Composite::integrate(const Functor& f, double a, double b) const {
    double step = (b - a) / intervals_;
    double result = 0.0;
    for (int i = 0; i < intervals_; ++i) {
        double x0 = a + i * step;
        double x1 = x0 + step;
        result += rule_.integrate(f, x0, x1);
    }
    return result;
}
#endif
