accessing
initialize 

	running := true.
	zmqPullSocket := ZmqApi context zmqPullSocket.
	zmqPullSocket connect: 'tcp://33.33.33.10:9999'.
	zmqPubSocket := ZmqApi context zmqPublisherSocket.
	zmqPubSocket connect: 'tcp://33.33.33.10:9998'.
	
	
	