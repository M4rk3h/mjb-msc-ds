# New Notes
I cloned my initial worker (bdea-worker) and edited the hosts, hostname, created a static ip and tried to set up ssh from the main node and tried to run hadoop. 

I ran into a few issues, which included not being able to start up my new node (hadoop-cw) from the main node, even though all of the settings seemed to be the same as the other worker node.

To make sure there wasn't anything wrong with my other nodes, i started the whole cluster again (starting with the main node which is now named 'hadoop-main'). 

Got an error when starting the hdfs cluster with (start-all.sh) which isn't recommended but I wanted to check the error logs. The first error was that The main node was unable to speak to itself, so I 'added' its own sshkey to itself?! Which is a bit confusing. 

I added a sshkey on all 3 machines, and copied all keys to each other, which still had the permission denies error.