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