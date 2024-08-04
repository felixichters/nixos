#ifndef COMPOSITE_H
#define COMPOSITE_H

#include "Quadrature.h"

auto omposite(const Quadrature& rule, int intervals)
    : rule_(rule), intervals_(intervals) {}

auto integrate = [](const Functor& f, double a, double b) const {
    double step = (b - a) / intervals_;
    double result = 0.0;
    for (int i = 0; i < intervals_; ++i) {
        double x0 = a + i * step;
        double x1 = x0 + step;
        result += rule_.integrate(f, x0, x1);
    }
    return result;
}

double Composite::ExpectedOrderOfConvergence() const {
    return dynamic_cast<const Trapez*>(&rule_) ? 2.0 : 4.0;
}


class Composite {
public:
    Composite(const Quadrature& rule, int intervals);

    double integrate(const Functor& f, double a, double b) const;

    double ExpectedOrderOfConvergence() const;

private:
    const Quadrature& rule_;
    int intervals_;
};

#endif
