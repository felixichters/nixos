#ifndef SIMPSON_H
#define SIMPSON_H

#include <functional>

auto simpson = [](std::function<double(double)> f, double a, double b) {
    double c = (a + b) / 2.0;
    return (b - a) * (f(a) + 4.0 * f(c) + f(b)) / 6.0;
}

double Simpson::integrate(const Functor& f, double b, double a) const {

    double c = (a + b) / 2.0;
    return (b - a) * (f(a) + 4.0 * f(c) + f(b)) / 6.0;
}

#endif
