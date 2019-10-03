#!/bin/bash

cd ../
echo "Running tests"
newman run TestAPI/WSO2_API_STORE_TESTS.postman_collection.json -e StagingEnvironment/Staging.postman_environment.json --bail
echo "Tests are completed for staging environment"
