#!/bin/bash
numFaults=1
numOperations=500
numPrimaries=3

for ((  i = 0 ;  i <= ($numFaults \* $numPrimaries);  i++  ))
do
java -jar ReplicatedLinkedList.jar $i &
sleep 10
done

for ((  i = 0 ;  i < $numPrimaries;  i++  ))
do
java -jar OriginalLinkedList.jar $i & 
sleep 10
done
java -jar ReplicationListClient.jar  $numPrimaries $numFaults $numOperations 


