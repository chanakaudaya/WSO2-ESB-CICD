# WSO2-ESB-CICD
Project which contains code to implements a CICD process for WSO2 ESB/EI

# The Process
![alt text] (https://github.com/chanakaudaya/WSO2-ESB-CICD/blob/master/cicd-process.png)

# Prerequisites
These artefacts and scripts are written to test in a local setup which has 2 WSO2 EI nodes running locally with port offset 0 and 2. You should have those instances running to test these scripts.

# Folder Structure
1) CICDESBProject - This project contains the ESB configurations which are going to be deployed into Staging and Production environments.

2) CICDESBProjectConnectorExporter - This contains the ESB connectors which are going to be included with this project. Salesforce connector has been included as a sample.

3) CICDESBProjectRegistryProduction - This contains the registry artifacts which holds production environment specific details of the ESB artifacts like endpoints, templates, etc.

4) CICDESBProjectRegistryStaging - This contains the registry artifacts which holds staging environment specific details of the ESB artifacts like endpoints, templates, etc.

5) CICDESBProjectCompositeApplicationProduction - This contains the pom file use to create the composite application which will be deployed into production environment. It will compose the ESB project artifacts along with registry artefacts for production environment (1, 2 & 3).

6) CICDESBProjectCompositeApplicationStaging - This contains the pom file use to create the composite application which will be deployed into staging environment. It will compose the ESB project artifacts along with registry artefacts for staging environment (1, 2 & 4).

7) TestAPI - This directory contains the postman scripts which will be used to test the artefacts deployed in each environment. 

8) ProductionEnvironment - This contains details about production environment servers

9) StagingEnvironment - This contains details about staging environment servers

10) BackendServices - This contains sample backend services implemented with Ballerina for testing purposes.

11) src - This contains the keystore file which will be used by the maven car deploy plugin when deploying artefacts in to the servers. 

# How to run
sh deploy.sh

# What happens when running the above command
* Build the CAR files
* Deploy to staging environment
* Test the staging environment
* Deploy to production environment
* Test the production environment

