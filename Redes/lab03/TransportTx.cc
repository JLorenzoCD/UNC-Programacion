#ifndef TRANSPORT_TX
#define TRANSPORT_TX

#include <string.h>
#include <omnetpp.h>

// #include "FeedbackPkt_m.h"

using namespace omnetpp;

class TransportTx : public cSimpleModule {
private:
    cQueue buffer;
    cMessage *endServiceEvent;
    int bufferSize;
    cOutVector bufferSizeVector;
    cOutVector packetDropVector;
    bool feedback_was_received;
public:
    TransportTx();
    virtual ~TransportTx();
protected:
    virtual void initialize();
    virtual void finish();
    virtual void handleMessage(cMessage *msg);
};

Define_Module(TransportTx);

TransportTx::TransportTx() {
    endServiceEvent = NULL;
    feedback_was_received = true;
}

TransportTx::~TransportTx() {
    cancelAndDelete(endServiceEvent);
}

void TransportTx::initialize() {
    buffer.setName("buffer");
    endServiceEvent = new cMessage("endService");
    bufferSizeVector.setName("BufferSize");
    packetDropVector.setName("PacketDrop");
}

void TransportTx::finish() {
}

void TransportTx::handleMessage(cMessage *msg) {

    // if msg is signaling an endServiceEvent
    if (msg == endServiceEvent) {
        // if packet in buffer, send next one

        if (!buffer.isEmpty() && feedback_was_received) {
            // dequeue packet
            cPacket *pkt = (cPacket*)buffer.pop();

            // send packet
            send(pkt, "toOut$o");

            feedback_was_received = false;

            // start new service
            simtime_t_cref serviceTime = pkt->getDuration();
            scheduleAt(simTime() + serviceTime, endServiceEvent);
        }
    }
    else if (msg->getKind() == 2) {
        // msg is a feedbackPkt
        // FeedbackPkt* feedbackPkt = (FeedbackPkt*)msg;

        // Es parada y espera, por lo que al recibir el FeedbackPkt significa
        // que ya puedo enviar el siguiente paquete
        feedback_was_received = true;

        // if the server is idle
        if (!endServiceEvent->isScheduled()) {
            // start the service now
            scheduleAt(simTime() + 0, endServiceEvent);
        }

        delete (msg);
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

#endif /* TRANSPORT_TX */

