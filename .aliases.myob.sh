alias fly_tax='fly -t taxonline'
function fly_tax_prune_workers() { fly_tax workers | grep stalled | awk '{print $1;}' | xargs -n 1 fly -t taxonline prune-worker -w; };

alias taxprofile_dump="dynamodbexportcsv --awsregion 'ap-southeast-2' --table 'TaxProfile' --columns 'orgId,userId,authorisedNameFirst,authorisedNameLast,businessNumber,orgUri,role,ssn,contactNameFirst,contactNameLast,phoneNumber,registeredAgentNumber'"

export DEVTOOLS_VERSION=latest
. ~/code/taxonline-devtools/helpers/aliases.sh
