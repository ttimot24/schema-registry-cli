#!/usr/bin/env bash

export SCHEMA_REGISTRY_URL="localhost:8081"

all_files=$(find . -type f -name "*.avsc");

while IFS= read -r schema_file; do
    echo "Migrate schema: $schema_file"

    sub_name=$(basename $schema_file);
    
   ./schema-registry-cli subject schema create "${sub_name%.*}" "$(jq -c < $schema_file)" | jq
done <<< "$all_files"
