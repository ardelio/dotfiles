alias upload_aws_s3_sync_taxonline_ci='AWS_PROFILE=myobad aws s3 sync --exclude "*.tfstate" --sse aws:kms --sse-kms-key-id=5db5f6c9-b5ee-4479-8a33-45311162b30c . s3://taxonline-ci/'
alias download_aws_s3_sync_taxonline_ci='AWS_PROFILE=myobad aws s3 sync --exclude "*.tfstate" --sse aws:kms --sse-kms-key-id=5db5f6c9-b5ee-4479-8a33-45311162b30c s3://taxonline-ci/ .'
alias upload_taxonline_ci='(login_aws_myobad_apse2 && cd ~/scratch/taxonline-ci && upload_aws_s3_sync_taxonline_ci)'
alias download_taxonline_ci='(login_aws_myobad_apse2 && cd ~/scratch/taxonline-ci && download_aws_s3_sync_taxonline_ci)'

alias upload_aws_s3_sync_taxonline_assets='AWS_PROFILE=myobad aws s3 sync --exclude "*.tfstate" --sse aws:kms --sse-kms-key-id=4eead662-b8b7-43b2-bca1-6ab4b3829ad0 . s3://taxonline-assets/'
alias download_aws_s3_sync_taxonline_assets='AWS_PROFILE=myobad aws s3 sync --exclude "*.tfstate" --sse aws:kms --sse-kms-key-id=4eead662-b8b7-43b2-bca1-6ab4b3829ad0 s3://taxonline-assets/ .'
alias upload_taxonline_assets='(login_aws_myobad_apse2 && cd ~/scratch/taxonline-assets && upload_aws_s3_sync_taxonline_assets)'
alias download_taxonline_assets='(login_aws_myobad_apse2 && cd ~/scratch/taxonline-assets && download_aws_s3_sync_taxonline_assets)'

alias fly_tax='fly -t taxonline'
function fly_tax_prune_workers() { fly_tax workers | grep stalled | awk '{print $1;}' | xargs -n 1 fly -t taxonline prune-worker -w; };

export DEVTOOLS_VERSION=0.11.0
. ~/code/taxonline-devops/helpers/aliases.sh
