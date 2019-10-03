#!/bin/bash

cd ../
echo "Running tests"
newman run TestAPI/WSO2_API_STORE_TESTS.postman_collection.json -e ProductionEnvironment/Production.postman_environment.json --bail
echo "Tests are completed for production environment"
