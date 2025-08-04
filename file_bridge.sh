#!/bin/bash

# Usage:
# ./upload_databricks_to_gdrive.sh <dbfs_path> <local_folder> <gdrive_remote_path>

# Input arguments
DBFS_PATH="$1"
LOCAL_FOLDER="$2"
RCLONE_CONFIG="$3"
GDRIVE_PATH="$4"


#!/bin/bash

# Step 1: Download from DBFS
echo "Downloading from DBFS: $DBFS_PATH → $LOCAL_FOLDER"
databricks fs cp -r "$DBFS_PATH" "$LOCAL_FOLDER"

# Step 2: Upload to Google Drive
FULLGPATH="${RCLONE_CONFIG}:/${GDRIVE_PATH}"
echo "*****Uploading to Google Drive: $LOCAL_FOLDER → $FULLGPATH"
rclone copy "$LOCAL_FOLDER" "$FULLGPATH" --progress
