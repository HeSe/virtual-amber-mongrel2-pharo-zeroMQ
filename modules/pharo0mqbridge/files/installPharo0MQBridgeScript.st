|repo|

repo := MCFileTreeRepository new directory: (FileDirectory on: '//opt/pharozmqwebbridge').

Gofer new
    repository: repo;
    package: 'Amber-ZeroMQ';
    load.

Author fullName: 'SebastianHeidbrink'.

Smalltalk snapshot: true andQuit: true.