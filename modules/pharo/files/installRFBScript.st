Gofer new
  squeaksource: 'MetacelloRepository'; 
  package: 'ConfigurationOfRFB'; 
  load. 

((Smalltalk at: #ConfigurationOfRFB) 
    project version: #stable) load. 

RFBServer current
          initializePreferences;
          allowEmptyPasswords: true;
          allowLocalConnections: true;
          allowRemoteConnections: true;
          allowInteractiveConnections: true;
          connectionTypeDisconnect;
          configureForMemoryConservation.

RFBServer start:0.

Author fullName: 'SebastianHeidbrink'.

Smalltalk snapshot: true andQuit: true.