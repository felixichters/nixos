#include "matrix.h"
#include <iostream>
#include <iomanip> //for at() implementation
#include <random>
#include <algorithm>

using namespace std;

template <typename T>
void Matrix<T>::print() {
    for (const auto& row : elem) {
        for (const auto& el : row) {
            cout << el << " ";
        }
        cout << endl;
    }
}

template <typename T>
auto Matrix<T>::getElements() const -> const vector<vector<T>>& {
    return elem;
}

template <typename T>
auto Matrix<T>::operator[] (int m) const -> const vector<T>& {
    return elem[m];
}

template <typename T>
auto Matrix<T>::operator[] (int m) -> vector<T>& {
    return elem[m];
}

template <typename T>
auto Matrix<T>::operator () (int m, int n) const -> const T {
    return elem[m][n];
}

template <typename T>
auto Matrix<T>::operator () (int m, int n) -> T& {
    return elem[m][n];
}

template <typename T>
auto Matrix<T>::operator+=(const Matrix &b) -> Matrix& {
    if (rows != b.getRows() || col != b.getCols()) {
        throw invalid_argument("Matrix dimensions must agree.");
    }
    for (int i = 0; i < rows; ++i) {
        for (int j = 0; j < col; ++j) {
            elem[i][j] += b[i][j];
        }
    }
    return *this;
}

template <typename T>
void Matrix<T>::resize(int rows, int cols) {
    elem.resize(rows);
    for (auto& row : elem) {
        row.resize(cols);
    }
    this->rows = rows;
    this->col = cols;
}

template <typename T>
void Matrix<T>::resize(int rows, int cols, T value) {
    elem.resize(rows);
    for (auto& row : elem) {
        row.resize(cols, value);
    }
    this->rows = rows;
    this->col = cols;
}

template <typename T>
auto Matrix<T>::operator*=(T s) -> Matrix {
    for (auto& row : elem) {
        for (auto& el : row) {
            el *= s;
        }
    }
    return *this;
}

template <typename T>
auto Matrix<T>::operator*=(const vector<T> &vec) -> Matrix& {
    if (col == vec.size()) {
        vector<T> result(rows, 0.0);
        for (int i = 0; i < rows; ++i) {
            for (int j = 0; j < col; ++j) {
                result[i] += elem[i][j] * vec[j];
            }
        } 

        resize(rows, 1);

        for (int i = 0; i < rows; ++i) {
            elem[i][0] = result[i];
        } 

        return *this;
    } else {
        cerr << "The sizes of the vector and matrix do not fit!";
        cerr << endl;
        exit(EXIT_FAILURE);
    }
}

template <typename T>
auto Matrix<T>::operator*=(const Matrix<T>& a) -> Matrix& {
    if(col == a.rows) {
        Matrix result(rows, a.col, 0);
        for (int i = 0; i < rows; ++i) {
            for (int j = 0; j < a.col; ++j) {
                for (int k = 0; k < col; ++k) {
                    result[i][j] += elem[i][k] * a[k][j];
                }
            }
        } 

        elem = std::move(result.elem);
        col = result.col;
        return *this;
    } else {
        cerr << "The given matrices are incompatible for multiplication!";
        cerr << endl;
        exit(EXIT_FAILURE);
    }
}

template <typename T>
auto operator*(const Matrix<T> &a, const vector<T> &x) -> vector<T> {
    if (a.getCols() != x.size()) {
        throw invalid_argument("Matrix and vector size mismatch");
    }
    vector<T> y(a.getRows(), 0);
    for (int i = 0; i < a.getRows(); ++i) {
        for (int j = 0; j < a.getCols(); ++j) {
            y[i] += a[i][j] * x[j];
        }
    }
    return y;
}

template <typename T>
auto operator*(const Matrix<T> &a, const Vector &x) -> Vector {
    return a * x.getEntries();
}

template <typename T>
auto operator*(const Matrix<T> &a, const Matrix<T> &b) -> Matrix<T> {
    if (a.getCols() != b.getRows()) {
        cerr << "Dimensions of matrix a (" << a.getRows() << "x" << a.getCols()
            << ") and matrix b (" << b.getRows() << "x" << b.getCols()
            << ") do not match!";
        cerr << endl;
        throw invalid_argument("Dimensions do not match");
    }
    Matrix<T> output(a);
    output *= b;
    return output;
}
