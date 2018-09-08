#!/bin/bash
#Build the artefacts
mvn clean install -q

#Deploy them into servers
if [[ $1 == "staging" ]]; then
	echo "Starting to deploy into Staging"
        cd ./CICDESBProjectCompositeApplicationStaging
	mvn clean deploy -Dmaven.deploy.skip=true -Dmaven.car.deploy.skip=false
	echo "Deploying the artefacts"
	sleep 10
	cd ../
	echo "Running tests"
	newman run TestAPI/WSO2_API_STORE_TESTS.postman_collection.json -e StagingEnvironment/Staging.postman_environment.json --bail
	echo "Tests are completed for $1 environment"
elif [[ $1 == "production" ]]; then
	echo "Starting to deploy into Production"
	cd ./CICDESBProjectCompositeApplicationProduction
	mvn clean deploy -Dmaven.deploy.skip=true -Dmaven.car.deploy.skip=false
	echo "Deploying the artefacts"
	sleep 10
	cd ../
	echo "Running tests"
	newman run TestAPI/WSO2_API_STORE_TESTS.postman_collection.json -e ProductionEnvironment/Production.postman_environment.json --bail
	echo "Tests are completed for $1 environment"
else
        echo "Starting to deploy into Staging"
        cd ./CICDESBProjectCompositeApplicationStaging
	mvn clean deploy -Dmaven.deploy.skip=true -Dmaven.car.deploy.skip=false
	echo "Deploying the artefacts"
	sleep 10
	cd ../
	echo "Running tests"
	newman run TestAPI/WSO2_API_STORE_TESTS.postman_collection.json -e StagingEnvironment/Staging.postman_environment.json --bail
	echo "Tests are completed for staging environment"
	echo "Starting to deploy into Production"
	cd ./CICDESBProjectCompositeApplicationProduction
	mvn clean deploy -Dmaven.deploy.skip=true -Dmaven.car.deploy.skip=false
	echo "Deploying the artefacts"
	sleep 10
	cd ../
	echo "Running tests"
	newman run TestAPI/WSO2_API_STORE_TESTS.postman_collection.json -e ProductionEnvironment/Production.postman_environment.json --bail
	echo "Tests are completed for production environment"
fi
