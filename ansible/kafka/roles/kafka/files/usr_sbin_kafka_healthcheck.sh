#!/bin/bash

echo "Checking under replicated partitions: "
/opt/kafka/bin/kafka-topics.sh --describe --bootstrap-server localhost:9092  --under-replicated-partitions

echo "Checking unavailable partitions: "
/opt/kafka/bin/kafka-topics.sh --describe --bootstrap-server localhost:9092  --unavailable-partitions