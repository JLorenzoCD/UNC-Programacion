#ifndef NET
#define NET

#include <string.h>
#include <omnetpp.h>
#include <packet_m.h>
#include <feedbackPkt_m.h>
#include "constants.h"
#include "NetTable.h"

using namespace omnetpp;

class Net: public cSimpleModule {
private:
    NetTable netTable; 
    int linkToSend;
    cMessage *sendFeedBackEvent;
public:
    Net();
    virtual ~Net();
protected:
    virtual void initialize();
    virtual void finish();
    virtual void handleMessage(cMessage *msg);
};

Define_Module(Net);

#endif /* NET */

Net::Net() {
}

Net::~Net() {
}

void Net::initialize() {
    linkToSend = 0;
    if (par("interFeedBackTime").doubleValue() != 0) {
        sendFeedBackEvent = new cMessage("sendFeedBackEvent");
        scheduleAt(par("interFeedBackTime"), sendFeedBackEvent);
    }
}

void Net::finish() {
}

void Net::handleMessage(cMessage *msg) {
    // Event to receiver node
    if (msg == sendFeedBackEvent) {
        vector<int> sources = netTable.getSources();
        // packet creates for each sender node
        for(int source: sources){
            // create new feedback packet
            FeedbackPkt *feedbackPkt = new FeedbackPkt("feedbackPkt");
            int bestLink = netTable.getLinkWithLowestEMA(source);
            feedbackPkt->setDestination(source);
            feedbackPkt->setKind(PACKET_KIND_FEEDBACK);
            feedbackPkt->setLnk((bestLink + 1) % 2);
            feedbackPkt->setByteLength(PACKET_FEEDBACK_SIZE);
            // send to sender node
            send(feedbackPkt, "toLnk$o", bestLink);
        }
        
        // compute the new departure time and schedule next sendFeedbackEvent
        simtime_t departureTime = simTime() + par("interFeedBackTime");
        scheduleAt(departureTime, sendFeedBackEvent);
    }
    // Event to managment feedback packet
    else if(msg->getKind() == PACKET_KIND_FEEDBACK){
        FeedbackPkt *feedbackPkt = (FeedbackPkt *) msg;
        //Event to sender node
        if (feedbackPkt->getDestination() == this->getParentModule()->getIndex()) {
            linkToSend = feedbackPkt->getLnk();
        }
        //Event to intermediate Note
        else{
            short linkArrived = feedbackPkt->arrivedOn("toLnk$i", LINK0) ? LINK0: LINK1;
            send(msg, "toLnk$o", (linkArrived + 1) % 2);
        }
    }
    // Event Data Packet
    else{
        Packet *pkt = (Packet *) msg;
        
        // If this node is the final destination, send to App
        if (pkt->getDestination() == this->getParentModule()->getIndex()) {
            int source = pkt->getSource();
            double delay = (simTime() - pkt->getCreationTime()).dbl();
            short linkArrived = msg->arrivedOn("toLnk$i", LINK0) ? LINK0: LINK1;
            netTable.setCurrentEMA(source, linkArrived, delay);
            
            send(msg, "toApp$o");
        }
        // If not, forward the packet to some else... to who?
        else {
            // We send to link interface #0, which is the
            // one connected to the clockwise side of the ring
            // Is this the best choice? are there others?
            if (pkt->arrivedOn("toApp$i")) {
                send(msg, "toLnk$o", linkToSend);
            } else {
                short linkArrived = msg->arrivedOn("toLnk$i", LINK0) ? LINK0: LINK1;
                send(msg, "toLnk$o", (linkArrived + 1) % 2);
            }
        }
    }
}
