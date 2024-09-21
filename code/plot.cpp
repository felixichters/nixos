#include "plot.h"
#include <iostream>

void plotVector(const std::vector<int>& vec) {
    const int size = 21; // Größe des Koordinatensystems (von -10 bis 10 inklusive)
    const int offset = 10; // Offset, um negative Koordinaten zu handhaben

    // Erstellen eines 2D-Arrays für das Koordinatensystem
    char grid[size][size];

    // Initialisieren des Grids mit Leerzeichen
    for (int i = 0; i < size; ++i) {
        for (int j = 0; j < size; ++j) {
            grid[i][j] = ' ';
        }
    }

    // Achsen hinzufügen
    for (int i = 0; i < size; ++i) {
        grid[i][offset] = '|'; // y-Achse
        grid[offset][i] = '-'; // x-Achse
    }
    grid[offset][offset] = '+'; // Ursprung

    // Plotten der Vektorelemente
    for (size_t i = 0; i < vec.size(); ++i) {
        int x = i - offset; // Index wird auf x-Koordinate gemappt
        int y = vec[i]; // y-Koordinate ist der Wert des Vektors an Index i
        if (y >= -10 && y <= 10) {
            grid[offset - y][offset + x] = '*'; // Punkt plotten
        }
    }

    // Grid ausgeben
    for (int i = 0; i < size; ++i) {
        for (int j = 0; j < size; ++j) {
            std::cout << grid[i][j];
        }
        std::cout << std::endl;
    }
}

