#!/bin/bash

if [[ $1 =~ ^[Ff][Rr] ]]; then
	#FR
	psql -d dhis2 -U postgres -c "copy attribute from '/tmp/attributes.csv' delimiter ',' csv" > /dev/null
	psql -d dhis2 -U postgres -c "copy attributevalue from '/tmp/fields_values.csv' delimiter ',' csv" > /dev/null
	psql -d dhis2 -U postgres -c "copy organisationunit from '/tmp/facilities.csv' delimiter ',' csv" > /dev/null
	psql -d dhis2 -U postgres -c "copy organisationunitattributevalues from '/tmp/organisationunitattributevalues.csv' delimiter ',' csv" > /dev/null
	psql -d dhis2 -U postgres -c "copy orgunitgroup from '/tmp/orgunitgroup.csv' delimiter ',' csv" > /dev/null
	psql -d dhis2 -U postgres -c "copy orgunitgroupmembers from '/tmp/orgunitgroupmembers.csv' delimiter ',' csv" > /dev/null
elif [[ $1 =~ ^[Hh][Ww][Rr] ]]; then
	#HWR
	psql -d dhis2 -U postgres -c "copy userinfo from '/tmp/userInfo.csv' delimiter ',' csv" > /dev/null
	psql -d dhis2 -U postgres -c "copy userattributevalues from '/tmp/userAttributeValues.csv' delimiter ',' csv" > /dev/null
	psql -d dhis2 -U postgres -c "copy users from '/tmp/users.csv' delimiter ',' csv" > /dev/null
	psql -d dhis2 -U postgres -c "copy userrole from '/tmp/userRole.csv' delimiter ',' csv" > /dev/null
	psql -d dhis2 -U postgres -c "copy userroleauthorities from '/tmp/userRoleAuthorities.csv' delimiter ',' csv" > /dev/null
	psql -d dhis2 -U postgres -c "copy userrolemembers from '/tmp/userRoleMembers.csv' delimiter ',' csv" > /dev/null
	psql -d dhis2 -U postgres -c "copy usermembership from '/tmp/userMembership.csv' delimiter ',' csv" > /dev/null
	psql -d dhis2 -U postgres -c "copy usersetting from '/tmp/userSetting.csv' delimiter ',' csv" > /dev/null
fi
