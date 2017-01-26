alias login_aws_myobad_apse2='aws-adfs login --adfs-host adfs.myob.com.au --profile myobad --region ap-southeast-2'
alias login_aws_myobaprod_apse2='aws-adfs login --adfs-host adfs.myob.com.au --profile myobaprod --region ap-southeast-2'

alias upload_aws_s3_sync_taxonline_ci='AWS_PROFILE=myobad aws s3 sync --sse aws:kms --sse-kms-key-id=5db5f6c9-b5ee-4479-8a33-45311162b30c . s3://taxonline-ci/'
alias download_aws_s3_sync_taxonline_ci='AWS_PROFILE=myobad aws s3 sync --sse aws:kms --sse-kms-key-id=5db5f6c9-b5ee-4479-8a33-45311162b30c s3://taxonline-ci/ .'
alias upload_taxonline_ci='(login_aws_myobad_apse2 && cd ~/scratch/taxonline-ci && upload_aws_s3_sync_taxonline_ci)'
alias download_taxonline_ci='(login_aws_myobad_apse2 && cd ~/scratch/taxonline-ci && download_aws_s3_sync_taxonline_ci)'

alias fly_tax='fly -t taxonline'
function fly_tax_prune_workers() { fly_tax workers | grep stalled | awk '{print $1;}' | xargs -n 1 fly -t taxonline prune-worker -w; };
