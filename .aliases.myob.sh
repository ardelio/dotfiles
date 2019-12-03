alias fly_tax='fly -t taxonline'
function fly_tax_prune_workers() { fly_tax workers | grep stalled | awk '{print $1;}' | xargs -n 1 fly -t taxonline prune-worker -w; };

alias taxprofile_dump="dynamodbexportcsv --awsregion 'ap-southeast-2' --table 'TaxProfile' --columns 'orgId,userId,authorisedNameFirst,authorisedNameLast,businessNumber,orgUri,role,ssn,contactNameFirst,contactNameLast,phoneNumber,registeredAgentNumber'"

export DEVTOOLS_VERSION=latest
. ~/code/taxonline-devtools/helpers/aliases.sh

alias tax_db_conx_prod='AWS_PROFILE=qprod aws s3 cp s3://myob-ex-taxonline-prod-assets/terraform/prod/taxonline-taxapi-db/output.json - | jq -r "\"psql -h \" + .taxonline_tax_api_db_host + \" -d \" + .taxonline_tax_api_db_name + \" -U \" + .taxonline_tax_api_db_user + \" # \" + .taxonline_tax_api_db_password" | pbcopy'
alias tax_db_conx_qa='aws s3 cp s3://myob-ex-taxonline-development-assets/terraform/qa/taxonline-taxapi-db/output.json - | jq -r "\"psql -h \" + .taxonline_tax_api_db_host + \" -d \" + .taxonline_tax_api_db_name + \" -U \" + .taxonline_tax_api_db_user + \" # \" + .taxonline_tax_api_db_password" | pbcopy'

alias awslogin_quasar_dev='myob-auth login --username `whoami` --role adfs-ex-taxonline-development-admin'
alias awslogin_quasar_prod='myob-auth login --username `whoami` --role adfs-ex-taxonline-production-admin --profile qprod'
alias awslogin_fe_dev='myob-auth login --username `whoami` --role adfs-acc-workpapers-and-compliance-development-admin'
alias awslogin_fe_prod='myob-auth login --username `whoami` --role adfs-acc-workpapers-and-compliance-production-admin --profile feprod'
alias awslogin_fe_prod_default='myob-auth login --username `whoami` --role adfs-acc-workpapers-and-compliance-production-admin'

alias ylbt='yarn lint && yarn build && yarn test'
