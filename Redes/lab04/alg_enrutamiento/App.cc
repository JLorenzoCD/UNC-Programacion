#ifndef APP
#define APP

#include <string.h>
#include <omnetpp.h>
#include <packet_m.h>
#include "constants.h"

using namespace omnetpp;

class App : public cSimpleModule {
private:
    cMessage *sendMsgEvent;
    std::map<int, cStdDev> delayStats;
    std::map<int, cOutVector> delayVector;
    std::map<int, cOutVector> hopCountVector;
public:
    App();
    virtual ~App();
protected:
    virtual void initialize();
    virtual void finish();
    virtual void handleMessage(cMessage *msg);
};

Define_Module(App);

#endif /* APP */

App::App() {
}

App::~App() {
}

void App::initialize() {

    // If interArrivalTime for this node is higher than 0
    // initialize packet generator by scheduling sendMsgEvent
    if (par("interArrivalTime").doubleValue() != 0) {
        sendMsgEvent = new cMessage("sendEvent");
        scheduleAt(par("interArrivalTime"), sendMsgEvent);
    }

    // Initialize statistics
    // delayStats.setName("TotalDelay");
    // delayVector.setName("Delay");
    // hopCountVector.setName("HopCount");

}

void App::finish() {
    // Record statistics
    // recordScalar("Average delay", delayStats.getMean());
    // recordScalar("Number of packets", delayStats.getCount());

    for (const auto& [source, stats] : delayStats) {
        std::string delayName = "Average delay (source=" + std::to_string(source) + ")";
        std::string countName = "Packets received (source=" + std::to_string(source) + ")";

        recordScalar(delayName.c_str(), stats.getMean());
        recordScalar(countName.c_str(), stats.getCount());
    }
}

void App::handleMessage(cMessage *msg) {

    // if msg is a sendMsgEvent, create and send new packet
    if (msg == sendMsgEvent) {
        // create new packet
        Packet *pkt = new Packet("packet", this->getParentModule()->getIndex());
        pkt->setByteLength(par("packetByteSize"));
        pkt->setDestination(par("destination"));
        pkt->setKind(PACKET_KIND_DATA);
        pkt->setSource(this->getParentModule()->getIndex());
        pkt->setHopCount(0);
        // send to net layer
        send(pkt, "toNet$o");

        // compute the new departure time and schedule next sendMsgEvent
        simtime_t departureTime = simTime() + par("interArrivalTime");
        scheduleAt(departureTime, sendMsgEvent);

    }
    // else, msg is a packet from net layer
    else {
        // compute delay and record statistics
        Packet* pkt = (Packet*)msg;

        int source = pkt->getSource();
        simtime_t delay = simTime() - pkt->getCreationTime();

        delayStats[source].collect(delay);

        if (delayVector.find(source) == delayVector.end()) {
            // Crear el vector si aún no existe
            std::string vecName = "Delay Source " + std::to_string(source);
            delayVector[source].setName(vecName.c_str());
        }
        delayVector[source].record(delay);

        int hopCount = pkt->getHopCount();
        if (hopCountVector.find(source) == hopCountVector.end()) {
            // Crear el vector si aún no existe
            std::string vecName = "HopCount Source " + std::to_string(source);
            hopCountVector[source].setName(vecName.c_str());
        }
        hopCountVector[source].record(delay);

        // delete msg
        delete (msg);
    }

}
