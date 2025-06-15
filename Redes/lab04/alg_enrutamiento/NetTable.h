#ifndef NET_TABLE
#define NET_TABLE

#include <bits/stdc++.h>
#include "constants.h"

using namespace std;

class NetTable {
private:
    // Mapa cuyos keys son los nodos que enviaron paquetes (source), y su valor
    // es un arreglo de 2 elementos (link0 y link1) en el cual contiene un par
    // con un vector de flotas (delays) y un flotante (promedio de delays)
    map<int, array<double, 2 >> table;

public:
    NetTable();
    ~NetTable();

    bool isSourceSaved(int source);
    void setCurrentEMA(int source, short link, double delay);
    int getLinkWithLowestEMA(int source);
    double getCurrentEMA(int source, short link);
    vector<int> getSources();

protected:
};


#endif /* NET_TABLE */
