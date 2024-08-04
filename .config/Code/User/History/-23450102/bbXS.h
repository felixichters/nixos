#ifndef MATRIX_HH
#define MATRIX_HH

#include "Vector.cpp"
#include <vector>

using namespace std;

template <typename T>
class Matrix {
public:
    Matrix(int rows, int col, T initialValue = 0.0) : rows(rows), col(col),
        elem(rows, vector<T>(col, initialValue)) {};

    Matrix(int size, T initialValue = 0.0) : rows(size), col(size), 
        elem(size, vector<T>(size, initialValue)) {};

    Matrix(const Matrix &v) : elem(v.elem), rows(v.rows), col(v.col) {}; 

    Matrix(const vector<vector<T>> &a) {
        elem = a;
        rows = a.size();
        if (rows > 0)
            col = a[0].size();
        else
            col = 0;
    }

    void print();
    
    auto getRows() const -> const int { return rows; }

    auto getCols() const -> const int { return col; }

    auto getElements() const -> const vector<vector<T>>&;

    auto operator[] (int m) const -> const vector<T>&;
    
    auto operator[] (int m) -> vector<T>&; 
    
    auto operator () (int m, int n) const -> const T;

    auto operator () (int m, int n) -> T&;

    auto operator+=(const Matrix &b) -> Matrix&;

    void resize(int rows, int cols);

    void resize(int rows, int cols, T value);

    auto operator*=(T s) -> Matrix;

    auto operator*=(const vector<T> &vec) -> Matrix&;

    auto operator*=(const Matrix &b) -> Matrix&;

    void printAscii() const;

    void display_ithRow(int i) const;

    void genRandomInput(T min, T max);
    
private:
    int rows;
    int col;
    vector<vector<T>> elem;
}; 

template <typename T>
auto operator*(const Matrix<T> &a, const vector<T> &x) -> vector<T>;

template <typename T>
auto operator*(const Matrix<T> &a, const Vector &x) -> Vector;

template <typename T>
auto operator*(const Matrix<T> &a, T x) -> Matrix<T>;

template <typename T>
auto operator*(T x, const Matrix<T> &a) -> Matrix<T>;

template <typename T>
auto operator+(const Matrix<T> &a, const Matrix<T> &b) -> Matrix<T>;

template <typename T>
auto operator*(const Matrix<T> &a, const Matrix<T> &b) -> Matrix<T>;

#endif // MATRIX_HH