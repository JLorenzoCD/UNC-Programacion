#ifndef TRANSPORT_RX
#define TRANSPORT_RX

#include <string.h>
#include <omnetpp.h>

#include "FeedbackPkt_m.h"

using namespace omnetpp;

class TransportRx : public cSimpleModule {
private:
    cQueue buffer;
    cMessage *endServiceEvent;
    int bufferSize;
    cOutVector bufferSizeVector;
    cOutVector packetDropVector;
public:
    TransportRx();
    virtual ~TransportRx();
protected:
    virtual void initialize();
    virtual void finish();
    virtual void handleMessage(cMessage *msg);
};

Define_Module(TransportRx);

TransportRx::TransportRx() {
    endServiceEvent = NULL;
}

TransportRx::~TransportRx() {
    cancelAndDelete(endServiceEvent);
}

void TransportRx::initialize() {
    buffer.setName("buffer");
    endServiceEvent = new cMessage("endService");
    bufferSizeVector.setName("BufferSize");
    packetDropVector.setName("PacketDrop");
}

void TransportRx::finish() {
}

void TransportRx::handleMessage(cMessage *msg) {

    // if msg is signaling an endServiceEvent
    if (msg == endServiceEvent) {
        // if packet in buffer, send next one
        if (!buffer.isEmpty()) {
            // dequeue packet
            cPacket *pkt = (cPacket*)buffer.pop();

            // send packet
            send(pkt, "toApp");

            // send feedback
            feedbackPkt* fbPkt = new feedbackPkt();
            fbPkt->setByteLength(20);
            fbPkt->setKind(2);

            // Se usa parada y espera, por lo que no es necesario mandarle el
            // tamaño del buffer
            // fbPkt->setRemainingBuffer(par("bufferSize").longValue() - buffer.getLength());
            send(fbPkt, "toOut$o");

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

#endif /* TRANSPORT_RX */
