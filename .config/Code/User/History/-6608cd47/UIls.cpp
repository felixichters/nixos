#include <iostream>
#include <iomanip>
#include <random>
#include <algorithm>
#include <stdexcept>

template <typename T>
auto Matrix<T>::getElements() const -> const vector<vector<T>>& {
    return elem;
}

template <typename T>
auto Matrix<T>::operator[] (int m) const -> const vector<T>& {
    if (m < 0 || m >= rows) {
        cerr << "Illegal index " << m;
        cerr << "\n valid range is [0:" << rows - 1 << "]";
        cerr << endl;
        throw out_of_range("Index out of range");
    }

    return elem.at(m);
}

template <typename T>
auto Matrix<T>::operator[] (int m) -> vector<T>& {
    if (m < 0 || m >= rows) {
        cerr << "Illegal index " << m;
        cerr << "\n valid range is [0:" << rows - 1 << "]";
        cerr << endl;
        throw out_of_range("Index out of range");
    }

    return elem.at(m);
}

template <typename T>
auto Matrix<T>::operator() (int m, int n) const -> const T {
    if (m < 0 || m >= rows || n < 0 || n >= col) {
        cerr << "Illegal index " << m << " or " << n;
        cerr << "\n valid range is [0:" << rows - 1 << "][0:" << col - 1 << "]";
        cerr << endl;
        throw out_of_range("Index out of range");
    }

    return elem.at(m).at(n);
}

template <typename T>
auto Matrix<T>::operator() (int m, int n) -> T& {
    if (m < 0 || m >= rows || n < 0 || n >= col) {
        cerr << "Illegal index " << m << " or " << n;
        cerr << "\n valid range is [0:" << rows - 1 << "][0:" << col - 1 << "]";
        cerr << endl;
        throw out_of_range("Index out of range");
    }

    return elem.at(m).at(n);
}

template <typename T>
auto operator+(const Matrix<T> &a, const Matrix<T> &b) -> Matrix<T> {
    Matrix<T> output(a);
    output += b;
    return output;
}

template <typename T>
auto Matrix<T>::operator+=(const Matrix<T> &b) -> Matrix& {
    if (rows == b.rows && col == b.col) {
        for (auto i = 0; i <= rows - 1; ++i) {
            for (auto j = 0; j <= col - 1; ++j) {
                elem[i][j] += b[i][j];
            }
        }
        return *this;
    } else {
        cerr << "Error: Matrices have different sizes!";
        cerr << endl;
        throw invalid_argument("Matrices have different sizes");
    }
}

template <typename T>
auto operator*(const Matrix<T> &a, T x) -> Matrix<T> {
    Matrix<T> output(a);
    output *= x;
    return output;
}

template <typename T>
auto operator*(T x, const Matrix<T> &a) -> Matrix<T> {
    Matrix<T> output(a);
    output *= x;
    return output;
}

template <typename T>
auto operator*(const Matrix<T> &a, const vector<T> &x) -> vector<T> {
    if (x.size() != a.getCols()) {
        cerr << "Dimensions of vector " << x.size();
        cerr << " and matrix " << a.getCols() << " do not match!";
        cerr << endl;
        throw invalid_argument("Dimensions do not match");
    }
    vector<T> y(a.getRows());
    for (auto i = 0; i < a.getRows(); ++i) {
        y[i] = 0.;
        for (auto j = 0; j < a.getCols(); ++j)
            y[i] += a[i][j] * x[j];
    }
    return y;
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

template <typename T>
auto Matrix<T>::operator*=(T s) -> Matrix& {
    for (auto i = 0; i < rows; ++i) {
        for (auto j = 0; j < col; ++j) {
            elem[i][j] *= s;
        }
    }

    return *this;
}

template <typename T>
auto Matrix<T>::operator*=(const vector<T> &vec) -> Matrix& {
    if (col == vec.size()) {
        vector<T> result(rows, 0.0);
        for (auto i = 0; i < rows; ++i) {
            for (auto j = 0; j < col; ++j) {
                result[i] += elem[i][j] * vec[j];
            }
        }

        resize(rows, 1);

        for (auto i = 0; i < rows; ++i) {
            elem[i][0] = result[i];
        }

        return *this;
    } else {
        cerr << "The sizes of the vector and matrix do not fit!";
        cerr << endl;
        throw invalid_argument("Vector size does not match matrix columns");
    }
}

template <typename T>
auto Matrix<T>::operator*=(const Matrix<T>& a) -> Matrix& {
    if (col == a.rows) {
        Matrix result(rows, a.col, 0);
        for (auto i = 0; i < rows; ++i) {
            for (auto j = 0; j < a.col; ++j) {
                result[i][j] += elem[i][j] * a.elem[i][j];
            }
        }

        for (auto i = 0; i < rows; ++i) {
            for (auto j = 0; j < col; ++j) {
                elem[i][j] = result[i][j];
            }
        }

        return *this;
    } else {
        cerr << "The given matrices are incompatible for multiplication!";
        cerr << endl;
        throw invalid_argument("Matrix dimensions do not allow multiplication");
    }
}

template <typename T>
void Matrix<T>::print() const {
    for (auto i = 0; i < rows; ++i) {
        for (auto j = 0; j < col; ++j) {
            cout << setprecision(3);
            cout << elem[i][j] << " ";
        }

        cout << '\n';
    }
}

template <typename T>
void Matrix<T>::printAscii() const {
    int width = 8;
    cout << "+" << string((col * width + col - 1), '-') << "+" << endl;

    for (auto i = 0; i < rows; ++i) {
        cout << "|";
        for (auto j = 0; j < col; ++j) {
            cout << setw(width) << fixed << setprecision(3) << elem[i][j] << "|";
        }

        cout << endl;
        cout << "+" << string((col * width + col - 1), '-') << "+" << endl;
    }
}

template <typename T>
void Matrix<T>::display_ithRow(int i) const {
    if (i >= 0 && i < rows) {
        for (auto j = 0; j < col; ++j) {
            cout << elem[i][j] << " ";
        }
        cout << endl;
    } else {
        cerr << "Index out of bounds" << endl;
    }
}

template <typename T>
void Matrix<T>::genRandomInput(T min, T max) {
    random_device rd;
    mt19937 gen(rd());
    uniform_real_distribution<T> dis(min, max);

    for (auto &row : elem) {
        for (auto &element : row) {
            element = dis(gen);
        }
    }
}

template <typename T>
void Matrix<T>::resize(int rows_, int cols) {
    elem.resize(rows_, vector<T>(cols, 0.0));
    rows = rows_;
    col = cols;
}

template <typename T>
void Matrix<T>::resize(int rows_, int cols_, T value) {
    elem.resize(rows_, vector<T>(cols_, value));
    rows = rows_;
    col = cols_;
}