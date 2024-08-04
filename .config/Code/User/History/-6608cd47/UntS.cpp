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
    auto width = 8;
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
