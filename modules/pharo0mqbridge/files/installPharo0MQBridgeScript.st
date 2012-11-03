|repo|

repo := MCFileTreeRepository new directory: (FileDirectory on: '//opt/pharo-zeroMQWebBridge').

Gofer new
    repository: repo;
    package: 'ZeroMQWebBridge';
    load.

Author fullName: 'SebastianHeidbrink'.

Smalltalk snapshot: true andQuit: true.