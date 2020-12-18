#!/bin/bash

# so-create.sh
# Create a scratch org
# Deploy LWC Recipes
# Open scratch org

# Org Alias is entered from command line
if [ $1 == "" ]; then
  echo "Org Alias must be entered as first parameter."
  exit 1
fi

cd ..
sfdx force:org:create -s -f config/project-scratch-def.json -a $1
sfdx force:source:push
sfdx force:user:permset:assign -n recipes
sfdx force:data:tree:import -p ./data/data-plan.json
sfdx force:org:open
