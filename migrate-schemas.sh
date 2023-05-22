#!/usr/bin/env bash

echo 'Migrate schemas:'
for schema in /tmp/schemas/*$SCHEMA_TYPE; do
  echo $schema
  cat $schema | /usr/bin/schema-registry-cli subject schema create $(basename $schema $SCHEMA_TYPE)
done
