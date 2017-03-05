alias fly_tax='fly -t taxonline'
function fly_tax_prune_workers() { fly_tax workers | grep stalled | awk '{print $1;}' | xargs -n 1 fly -t taxonline prune-worker -w; };

export DEVTOOLS_VERSION=0.13.0
. ~/code/taxonline-devops/helpers/aliases.sh
