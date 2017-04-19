#!/bin/bash

psql -d dhis2 -U postgres -c "copy attribute from '/tmp/attributes.csv' delimiter ',' csv" > /dev/null
psql -d dhis2 -U postgres -c "copy attributevalue from '/tmp/fields_values.csv' delimiter ',' csv" > /dev/null
psql -d dhis2 -U postgres -c "copy organisationunit from '/tmp/facilities.csv' delimiter ',' csv" > /dev/null
psql -d dhis2 -U postgres -c "copy organisationunitattributevalues from '/tmp/organisationunitattributevalues.csv' delimiter ',' csv" > /dev/null
