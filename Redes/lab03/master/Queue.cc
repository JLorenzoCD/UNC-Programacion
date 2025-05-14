#ifndef QUEUE
#define QUEUE

#include <string.h>
#include <omnetpp.h>

#include "lab_constants.h"

using namespace omnetpp;

class Queue : public cSimpleModule {
private:
    cQueue buffer;
    cMessage *endServiceEvent;
    int bufferSize;
    cOutVector bufferSizeVector;
    cOutVector packetDropVector;

    // Métrica para saber los envíos del transmisor
    cOutVector packetSendVector;
public:
    Queue();
    virtual ~Queue();
protected:
    virtual void initialize();
    virtual void finish();
    virtual void handleMessage(cMessage *msg);
};

Define_Module(Queue);

Queue::Queue() {
    endServiceEvent = NULL;
}

Queue::~Queue() {
    cancelAndDelete(endServiceEvent);
}

void Queue::initialize() {
    buffer.setName("buffer");
    endServiceEvent = new cMessage("endService");
    bufferSizeVector.setName("BufferSize");
    packetDropVector.setName("PacketDrop");

    packetSendVector.setName("PacketSend");
}

void Queue::finish() {
}

void Queue::handleMessage(cMessage *msg) {

    // if msg is signaling an endServiceEvent
    if (msg == endServiceEvent) {
        // if packet in buffer, send next one
        if (!buffer.isEmpty()) {
            // dequeue packet
            cPacket *pkt = (cPacket*)buffer.pop();

            // Se verifica que el paquete este saliendo del buffer del
            // transmisor
            if (pkt->getKind() == PACKET_KIND_SEND) {
                // Es un paquete que esta enviado el transmisor, por lo que se
                // guarda en la métrica packetSendVector
                packetSendVector.record(1);

                // Se le cambia el tipo de paquete para evitar duplicados
                pkt->setKind(0);
            }
            // send packet
            send(pkt, "out");

            // start new service
            simtime_t_cref serviceTime = pkt->getDuration();
            scheduleAt(simTime() + serviceTime, endServiceEvent);
        }
    }
    else if (buffer.getLength() >= par("bufferSize").intValue()) {
        // check buffer limit
        // drop the packet
        delete msg;
        this->bubble("packet dropped");
        packetDropVector.record(1);
    }
    else {
        // enqueue the packet
        buffer.insert(msg);
        bufferSizeVector.record(buffer.getLength());
        // if the server is idle
        if (!endServiceEvent->isScheduled()) {
            // start the service now
            scheduleAt(simTime() + 0, endServiceEvent);
        }
    }
}

#endif /* QUEUE */
