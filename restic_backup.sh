#! /bin/bash

B2_ACCOUNT_ID=<backblaze appkey id>
B2_ACCOUNT_KEY=<backblaze appkey key>

RESTIC_PASSWORD_FILE="/path/to/restic/repo/pass"
RESTIC_REPO="<backblaze b2 repo/repo"
RESTIC_UPLOAD_LIMIT="500000"
RESTIC_KEEP_LAST_SNAPSHOTS="4"

EXCLUDE_LIST="/path/to/excludes/file"
LOCAL_DIR="/path/to/local/dir/to/backup"


# Delete any unecessary snapshots and prune
restic -r $RESTIC_REPO -p $RESTIC_PASSWORD_FILE forget --keep-last $RESTIC_KEEP_LAST_SNAPSHOTS
restic -r $RESTIC_REPO -p $RESTIC_PASSWORD_FILE prune

# Run the backup
restic -r $RESTIC_REPO -p $RESTIC_PASSWORD_FILE --exclude-file $EXCLUDE_LIST backup $LOCAL_DIR

