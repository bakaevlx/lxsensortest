package inet.examples.emulation.lxsensortest;

import inet.nodes.inet.Router;
import inet.nodes.inet.StandardHost;
import ned.DatarateChannel;

network lxsensortest
{
    parameters:
        @display("bgb=582,195");
    submodules:
        server: StandardHost {
            parameters:
                @display("p=103,100;i=device/server");
            gates:
                pppg[1];
        }
        router: Router {
            parameters:
                numExtInterfaces = 1;
                @display("p=429,100;i=abstract/router");
            gates:
                pppg[1];
        }
    connections allowunconnected:
        router.pppg[0] <--> NormalPath <--> server.pppg[0];
}

channel NormalPath extends DatarateChannel
{
    parameters:
        datarate = 100Mbps;
        delay = 0.0565us; // 10m
        per = 0;
        ber = 0;
}
