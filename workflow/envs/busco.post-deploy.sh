#!/usr/bin/env bash
set -Eeu


DB_URL=https://busco-data.ezlab.org/v5/data/lineages/bacteria_odb10.2020-03-06.tar.gz
DB_PATH="$HOME/.nrw-geuebt/busco/"
FILENAME="bacteria_odb10"

echo "Downloading BUSCO database to ${DB_PATH} and extracting"

# Create Subdirectories
mkdir -p ${DB_PATH}
cd ${DB_PATH}
# Download
target="$FILENAME.tar.gz"
if [[ -f $target ]]; then
  echo "The file $target already exists. Skipping download."
else
  wget --output-document $target $DB_URL
  [[ $? -eq 0 ]] && [[ -s $target ]] && download_hash=$(openssl dgst -r -sha256 $target) && download_success=1
fi
[[ -n $download_hash ]] && echo "$download_hash" > $FILENAME.sha256
date --iso-8601='minutes' >> $FILENAME.timestamp
echo $DB_URL > $FILENAME.source
[[ "$download_success" == 1 ]] && tar -xzv -f $FILENAME.tar.gz && rm $FILENAME.tar.gz

echo "Downlaod complete"