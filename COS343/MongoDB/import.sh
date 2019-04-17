#!/bin/bash

psql \
  -host=faraday.cse.taylor.edu \
  -username=readonly \
  -no-align \
  -tuples-only \
  -command='SELECT row_to_json(f) FROM film as f' \
  dvdrental > films.JSON

mongoimport -db=dvdrental -collection=films films.json
