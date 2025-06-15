#include "NetTable.h"

NetTable::NetTable() {
}

NetTable::~NetTable() {
}

bool NetTable::isSourceSaved(int source) {
    return table.count(source) != 0;
}

// Guarda el delay proveniente del nodo y link indicado.
void NetTable::setCurrentEMA(int source, short link, double delay) {
    if (!isSourceSaved(source)) {
        // Se crea con los valores por defecto
        table[source];
    }

    double emaPrev = table[source][link]; 

    table[source][link] = (ALPHA * delay) + ((1 - ALPHA) * emaPrev);
}

int NetTable::getLinkWithLowestEMA(int source) {
    double currentEMAL0 = getCurrentEMA(source, LINK0);
    double currentEMAL1 = getCurrentEMA(source, LINK1);

    return currentEMAL0 < currentEMAL1 ? LINK0 : LINK1;
}

double NetTable::getCurrentEMA(int source, short link) {
    return table[source][link];
}

vector<int> NetTable::getSources() {
    vector<int> sources;

    for (const auto& pair : table) {
        sources.push_back(pair.first);
    }

    return sources;
}
