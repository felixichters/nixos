#include "Simpson.h"

auto simpson = [](std::function<double(double)>, double a, double b, int n)

double Simpson::integrate(const Functor& f, double b, double a) const {

    double c = (a + b) / 2.0;
    return (b - a) * (f(a) + 4.0 * f(c) + f(b)) / 6.0;
}


