    clear
    clc
    [X,T] = maglev_dataset;
    net = narxnet(1:5,1:5,10);
    [Xs,Xi,Ai,Ts] = preparets(net,X,{},T);
    net = train(net,Xs,Ts,Xi,Ai);
    view(net);
    Y = net(Xs,Xi,Ai);
    plotresponse(Ts,Y);