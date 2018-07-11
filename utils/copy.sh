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
		# DHIS: deleting translations data
		psql -d dhis2 -U postgres -c "DELETE FROM categoryoptiontranslations" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM trackedentityattributetranslations" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM programstagetranslations" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM programtranslations" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM dataelementtranslations" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM datasettranslations" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM objecttranslation" > /dev/null

		# DHIS: deleting dashboard data
		psql -d dhis2 -U postgres -c "DELETE FROM optionset" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM eventreport_organisationunits" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM eventreport_dataelementdimensions" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM eventreport_attributedimensions" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM trackedentitydataelementdimension" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM trackedentityattributedimension" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM eventreport_columns" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM dashboard_items" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM dashboarditem" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM eventreport" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM relativeperiods" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM dashboard" > /dev/null

		# DHIS: deleting default programs
		psql -d dhis2 -U postgres -c "DELETE FROM programstagedataelement" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM trackedentitydatavalue" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM programstageinstance" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM eventreport_columns" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM eventreport_organisationunits" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM eventreport" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM programstage" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM program_organisationunits" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM program_attributes" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM trackedentityattributevalue" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM trackedentityattribute" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM programinstance" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM program" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM trackedentityinstance" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM trackedentity" > /dev/null
		# DHIS: deleting default data elements & data sets
		psql -d dhis2 -U postgres -c "DELETE FROM datasetsource" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM datasetelement" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM dataset" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM datavalue" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM datavalueaudit" > /dev/null
		psql -d dhis2 -U postgres -c "DELETE FROM dataelement" > /dev/null
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
    # DHIS: adding programs
		psql -d dhis2 -U postgres -c "copy trackedentity from '/tmp/trackedentity.csv' delimiter ';' csv" > /dev/null
    psql -d dhis2 -U postgres -c "copy program from '/tmp/program.csv' delimiter ';' csv" > /dev/null
    psql -d dhis2 -U postgres -c "copy trackedentityattribute from '/tmp/trackedentityattribute.csv' delimiter ';' csv" > /dev/null
    psql -d dhis2 -U postgres -c "copy program_attributes from '/tmp/program_attributes.csv' delimiter ';' csv" > /dev/null
    psql -d dhis2 -U postgres -c "copy program_organisationunits from '/tmp/program_organisationunits.csv' delimiter ';' csv" > /dev/null
    psql -d dhis2 -U postgres -c "copy programstage from '/tmp/programstage.csv' delimiter ';' csv" > /dev/null
    psql -d dhis2 -U postgres -c "copy programstagedataelement from '/tmp/programstagedataelement.csv' delimiter ';' csv" > /dev/null
		# DHIS: adding dashboard data
		psql -d dhis2 -U postgres -c "copy dashboard from '/tmp/dashboard.csv' delimiter ';' csv" > /dev/null
		psql -d dhis2 -U postgres -c "copy relativeperiods from '/tmp/relativeperiods.csv' delimiter ';' csv" > /dev/null
		psql -d dhis2 -U postgres -c "copy eventreport from '/tmp/eventreport.csv' delimiter ';' csv" > /dev/null
		psql -d dhis2 -U postgres -c "copy dashboarditem from '/tmp/dashboarditem.csv' delimiter ';' csv" > /dev/null
		psql -d dhis2 -U postgres -c "copy dashboard_items from '/tmp/dashboard_items.csv' delimiter ';' csv" > /dev/null
		psql -d dhis2 -U postgres -c "copy optionset from '/tmp/optionset.csv' delimiter ';' csv" > /dev/null
		psql -d dhis2 -U postgres -c "copy trackedentitydataelementdimension from '/tmp/trackedentitydataelementdimension.csv' delimiter ';' csv" > /dev/null
		psql -d dhis2 -U postgres -c "copy trackedentityattributedimension from '/tmp/trackedentityattributedimension.csv' delimiter ';' csv" > /dev/null
		psql -d dhis2 -U postgres -c "copy eventreport_columns from '/tmp/eventreport_columns.csv' delimiter ';' csv" > /dev/null
		psql -d dhis2 -U postgres -c "copy eventreport_attributedimensions from '/tmp/eventreport_attributedimensions.csv' delimiter ';' csv" > /dev/null
		psql -d dhis2 -U postgres -c "copy eventreport_dataelementdimensions from '/tmp/eventreport_dataelementdimensions.csv' delimiter ';' csv" > /dev/null
		psql -d dhis2 -U postgres -c "copy eventreport_organisationunits from '/tmp/eventreport_organisationunits.csv' delimiter ';' csv" > /dev/null
		# DHIS: adding translations data
		psql -d dhis2 -U postgres -c "copy objecttranslation from '/tmp/objecttranslation.csv' delimiter ';' csv" > /dev/null
		psql -d dhis2 -U postgres -c "copy datasettranslations from '/tmp/datasettranslations.csv' delimiter ';' csv" > /dev/null
		psql -d dhis2 -U postgres -c "copy dataelementtranslations from '/tmp/dataelementtranslations.csv' delimiter ';' csv" > /dev/null
		psql -d dhis2 -U postgres -c "copy programtranslations from '/tmp/programtranslations.csv' delimiter ';' csv" > /dev/null
		psql -d dhis2 -U postgres -c "copy programstagetranslations from '/tmp/programstagetranslations.csv' delimiter ';' csv" > /dev/null
		psql -d dhis2 -U postgres -c "copy trackedentityattributetranslations from '/tmp/trackedentityattributetranslations.csv' delimiter ';' csv" > /dev/null
		psql -d dhis2 -U postgres -c "copy categoryoptiontranslations from '/tmp/categoryoptiontranslations.csv' delimiter ';' csv" > /dev/null

fi
