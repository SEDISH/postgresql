#!/bin/bash

# remove old reports
psql -d dhis2 -U postgres -c "DELETE FROM report" > /dev/null
