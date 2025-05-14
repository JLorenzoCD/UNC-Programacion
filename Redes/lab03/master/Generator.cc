#ifndef GENERATOR
#define GENERATOR

#include <string.h>
#include <omnetpp.h>

#include "lab_constants.h"

using namespace omnetpp;

class Generator : public cSimpleModule {
private:
    cMessage *sendMsgEvent;
    cStdDev transmissionStats;
    int packetByteSize;
    int packagesSent;
public:
    Generator();
    virtual ~Generator();
protected:
    virtual void initialize();
    virtual void finish();
    virtual void handleMessage(cMessage *msg);
};
Define_Module(Generator);

Generator::Generator() {
    sendMsgEvent = NULL;

}

Generator::~Generator() {
    cancelAndDelete(sendMsgEvent);
}

void Generator::initialize() {
    packagesSent = 0;
    transmissionStats.setName("TotalTransmissions");
    // create the send packet
    sendMsgEvent = new cMessage("sendEvent");
    // schedule the first event at random time
    scheduleAt(par("generationInterval"), sendMsgEvent);
}

void Generator::finish() {
}

void Generator::handleMessage(cMessage *msg) {

    // create new packet
    cPacket* pkt = new cPacket("packet");
    pkt->setByteLength(par("packetByteSize"));

    // Se establece el tipo del paquete para registrar los envíos del
    // transmisor
    pkt->setKind(PACKET_KIND_SEND);

    // send to the output
    send(pkt, "out");
    packagesSent++;

    // compute the new departure time
    simtime_t departureTime = simTime() + par("generationInterval");
    // schedule the new packet generation
    scheduleAt(departureTime, sendMsgEvent);
}

#endif /* GENERATOR */

