#!/bin/bash
numFaults=1
numOperations=500
numPrimaries=3


for ((  i = 0 ;  i < $numFaults;  i++  ))
do
java -jar FusedList.jar $i $numPrimaries $numFaults &
sleep 10
done

for ((  i = 0 ;  i < $numPrimaries;  i++  ))
do
java -jar FusionPrimaryList.jar $i $numFaults &
sleep 10
done

java -jar FusionListClient.jar  $numPrimaries $numFaults $numOperations
