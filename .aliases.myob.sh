alias fly_tax='fly -t taxonline'
function fly_tax_prune_workers() { fly_tax workers | grep stalled | awk '{print $1;}' | xargs -n 1 fly -t taxonline prune-worker -w; };

alias taxprofile_dump="dynamodbexportcsv --awsregion 'ap-southeast-2' --table 'TaxProfile' --columns 'orgId,userId,authorisedNameFirst,authorisedNameLast,businessNumber,orgUri,role,ssn,contactNameFirst,contactNameLast,phoneNumber,registeredAgentNumber'"

export DEVTOOLS_VERSION=latest
. ~/code/taxonline-devtools/helpers/aliases.sh

alias stack_aim='osascript /Users/anthony.sceresini/code/AD-OnlineTax-Common/stack-starter/stackStarter.applescript "NZ Aim" false true'
alias stack_egst='osascript /Users/anthony.sceresini/code/AD-OnlineTax-Common/stack-starter/stackStarter.applescript "NZ Egst" false true'
alias stack_bas_arl='osascript /Users/anthony.sceresini/code/AD-OnlineTax-Common/stack-starter/stackStarter.applescript "AU Bas" false true'
alias stack_bas_po='osascript /Users/anthony.sceresini/code/AD-OnlineTax-Common/stack-starter/stackStarter.applescript "AU PO" false true'

alias tax_db_conx_prod='AWS_PROFILE=prod aws s3 cp s3://myob-ex-taxonline-prod-assets/terraform/prod/taxonline-taxapi-db/output.json - | jq -r "\"psql -h \" + .taxonline_tax_api_db_host + \" -d \" + .taxonline_tax_api_db_name + \" -U \" + .taxonline_tax_api_db_user + \" # \" + .taxonline_tax_api_db_password" | pbcopy'
