#ifndef VECTOR_HH
#define VECTOR_HH


#include <vector>

class Vector {
public:
  void resize(int N_);

  void resize(int N_, double value);

  double &operator()(int i);

  double operator()(int i) const;

  double &operator[](int i);

  double operator[](int i) const;

  Vector &operator*=(double x);

  Vector &operator+=(const Vector &b);

  const std::vector<double> &getEntries() const;

  void print() const;

  int size() const { return N; }

  Vector(int N_) : entries(N_), N(N_){};

  Vector(int N_, double value) { resize(N_, value); };

  Vector(std::vector<double> v) {
    this->entries = v;
    N = v.size();
  }

  Vector(const Vector &v) {
    N = v.N;
    this->entries = v.getEntries();
  }
  
  std::vector<double> entries;

private:
  int N = 0;
};

Vector operator+(const Vector &a, const Vector &b);
Vector operator*(const Vector &a, double x);
Vector operator*(double x, const Vector &a);
double operator*(const Vector &a, const Vector &b);

#endif // VECTOR_HH
