#!/bin/bash

#Build the artefacts
mvn clean install -q

#Deploy into production environment
echo "Starting to deploy into Production"
cd ../CICDESBProjectCompositeApplicationProduction
mvn clean deploy -Dmaven.deploy.skip=true -Dmaven.car.deploy.skip=false
echo "Deploying the artefacts"
sleep 10
	