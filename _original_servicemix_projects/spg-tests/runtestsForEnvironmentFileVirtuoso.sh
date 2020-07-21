#!/bin/bash -x
set -e
if [[ $# -eq 0 ]] ; then
    echo 'usage: runtestsForEnvironment.sh environment.properties additional params  (environmentproperties being sol-dev.aws-105.properties or all-in-one-paul.properties or docker.virtuoso.properties or docker.properties)'
    exit 1
fi

# Always copy the keystores to the local /tmp folder (ensure the docker.properties file specifies this pathname)
#scp -i src/test/certificates/virtuoso_rsa vagrant@spg-all-200:/opt/spg/servicemix/etc/keystores/*.jks /tmp
#scp -i src/test/certificates/virtuoso_rsa src/test/resources/eicar.txt vagrant@spg-all-200:/tmp/



mvn -e clean install test surefire-report:report -DENVIRONMENT_DATA_FILE_PATH=$1 -Dmaven.test.failure.ignore=false $2 $3 $4 $5 $6
#mvn test   -DENVIRONMENT_DATA_FILE_PATH=$1 -Dtest=Test_Sending_Unstructured_Data#testUploadNewVirus
