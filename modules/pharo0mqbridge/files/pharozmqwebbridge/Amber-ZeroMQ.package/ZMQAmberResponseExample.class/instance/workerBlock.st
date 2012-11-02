accessing
workerBlock
	
	^[ | mMessage mResponse |
		
		mMessage := self zmqPullSocket receive.
		
		mResponse := self processMessage: mMessage.
		
		
		(Delay forMilliseconds: 100) wait.
		
		self zmqPubSocket send: mResponse.
		
		].

	
	