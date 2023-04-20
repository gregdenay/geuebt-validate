# Fetch minikraken DB
# Save metadata (Version, date downloaded, URL, etc...)


# As per the UNIX File System Hierarchy Standards, databases should be stored 
# under /var/lib/appname

DB_URL=https://genome-idx.s3.amazonaws.com/kraken/minikraken2_v2_8GB_201904.tgz
DB_PATH="/var/lib/kraken2/"
FILENAME="minikraken2"

echo "Downloading Kraken2 database to ${DB_PATH} and extracting"

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
[[ "$download_success" == 1 ]] && tar -xzv -f $FILENAME -C ${DB_PATH}

echo "Downlaod complete"