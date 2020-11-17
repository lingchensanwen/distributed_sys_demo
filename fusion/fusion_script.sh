echo "Result for Replication"
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

pkill -9 java
sleep 10

echo "Result for Old Fusion"
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

pkill -9 java
sleep 10

echo "Result for New Fusion"

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
pkill -9 java
sleep 10
