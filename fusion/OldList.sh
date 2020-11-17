#!/bin/bash
numFaults=1
numOperations=500
numPrimaries=3

for ((  i = 0 ;  i < $numFaults;  i++  ))
do
java -jar OldFusedLinkedList.jar $i $numPrimaries $numFaults &
sleep 10
done
for ((  i = 0 ;  i < $numPrimaries;  i++  ))
do
java -jar OriginalLinkedList.jar $i &
sleep 10
done

java -jar FusionLinkedListOracle.jar $numPrimaries $numFaults $numOperations
