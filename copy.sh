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
elif [[ $1 =~ ^[Xx][Dd][Ss][Ss][Aa][Mm][Pp][Ll][Ee] ]]; then
	#XDSSample
	psql -d dhis2 -U postgres -f /tmp/XDSDocTest.sql
elif [[ $1 =~ ^[Dd][Hh][Ii][Ss] ]]; then
    # DHIS: deleting default category
    psql -d dhis2 -U postgres -c "DELETE FROM categories_categoryoptions" > /dev/null
    psql -d dhis2 -U postgres -c "DELETE FROM categoryoptioncombos_categoryoptions" > /dev/null
    psql -d dhis2 -U postgres -c "DELETE FROM categorycombos_categories" > /dev/null
    psql -d dhis2 -U postgres -c "DELETE FROM categorycombos_optioncombos" > /dev/null
    psql -d dhis2 -U postgres -c "DELETE FROM dataelementcategory" > /dev/null
    psql -d dhis2 -U postgres -c "DELETE FROM dataelementcategoryoption" > /dev/null
    psql -d dhis2 -U postgres -c "DELETE FROM categorycombo" > /dev/null
    psql -d dhis2 -U postgres -c "DELETE FROM categoryoptioncombo" > /dev/null
    # DHIS: adding categories
    psql -d dhis2 -U postgres -c "copy categoryoptioncombo from '/tmp/categoryoptioncombo.csv' delimiter ';' csv" > /dev/null
    psql -d dhis2 -U postgres -c "copy categorycombo from '/tmp/categorycombo.csv' delimiter ';' csv" > /dev/null
    psql -d dhis2 -U postgres -c "copy dataelementcategoryoption from '/tmp/dataelementcategoryoption.csv' delimiter ';' csv" > /dev/null
    psql -d dhis2 -U postgres -c "copy dataelementcategory from '/tmp/dataelementcategory.csv' delimiter ';' csv" > /dev/null
    psql -d dhis2 -U postgres -c "copy categorycombos_optioncombos from '/tmp/categorycombos_optioncombos.csv' delimiter ';' csv" > /dev/null
    psql -d dhis2 -U postgres -c "copy categorycombos_categories from '/tmp/categorycombos_categories.csv' delimiter ';' csv" > /dev/null
    psql -d dhis2 -U postgres -c "copy categoryoptioncombos_categoryoptions from '/tmp/categoryoptioncombos_categoryoptions.csv' delimiter ';' csv" > /dev/null
    psql -d dhis2 -U postgres -c "copy categories_categoryoptions from '/tmp/categories_categoryoptions.csv' delimiter ';' csv" > /dev/null
    # DHIS: adding data elements & data sets
    psql -d dhis2 -U postgres -c "copy dataelement from '/tmp/dataelement.csv' delimiter ';' csv" > /dev/null
    psql -d dhis2 -U postgres -c "copy dataset from '/tmp/dataset.csv' delimiter ';' csv" > /dev/null
    psql -d dhis2 -U postgres -c "copy datasetelement from '/tmp/datasetelement.csv' delimiter ';' csv" > /dev/null
    psql -d dhis2 -U postgres -c "copy datasetsource from '/tmp/datasetsource.csv' delimiter ';' csv" > /dev/null
fi
