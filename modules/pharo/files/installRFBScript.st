Gofer new
  squeaksource: 'MetacelloRepository'; 
  package: 'ConfigurationOfRFB'; 
  load. 

((Smalltalk at: #ConfigurationOfRFB) 
    project version: #'bleedingEdge') load. 

RFBServer current
          initializePreferences;
          allowEmptyPasswords: true;
          allowLocalConnections: true;
          allowRemoteConnections: true;
          allowInteractiveConnections: true;
          connectionTypeDisconnect;
          allowZRLE: false; 
          setFullPassword: 'vagrant'.

RFBServer start:0.

Author fullName: 'SebastianHeidbrink'.

Smalltalk snapshot: true andQuit: true.