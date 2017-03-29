# remote-comm-jessie
Simple Debian 8 image with various packages installed for remote server management. Meant to be deployed on any cloud instance and populated with SSH keys and credentials to manage Kubernetes, `git` repos, etc.

## What's included
* `gnupg2` and `pinentry`
* `kubectl`
* `gcloud`
* `gcsfuse`

## Usage
* Run `gcloud init` to get started with Google Cloud

### Cloud Storage FUSE
**Note: Run these commands on the host**
* You'll need [Google Cloud SDK](https://cloud.google.com/sdk/docs/#install_the_latest_cloud_tools_version_cloudsdk_current_version "Google Cloud SDK Documentation"), [`gcsfuse`](https://github.com/GoogleCloudPlatform/gcsfuse/blob/master/docs/installing.md "gcsfuse/installing.md at master · GoogleCloudPlatform/gcsfuse") and [Docker Community Edition](https://store.docker.com/search?type=edition&offering=community "Docker Store")
* Obtain Application Default Credentials for `gcsfuse`
  * `gcloud auth application-default login`
  * Or use a [JSON file](https://developers.google.com/identity/protocols/application-default-credentials#howtheywork "How the Application Default Credentials work")
* Mount a GCS Bucket `gcsfuse -o allow_other my-bucket /mnt/my-bucket`
* Start a container with the bucket mounted
  `docker run -it -v /mnt/my-bucket:/mnt/my-bucket chepurko/remote-comm-jessie:v1.0.0 /bin/bash`

### Secrets and Credentials
* Install `ecryptfs-utils`...
