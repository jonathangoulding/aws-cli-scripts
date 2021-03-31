#!/bin/bash

RED='\033[0;31m'
LIGHT_BLUE='\033[1;34m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

array=(
    my-api
    my-ui 
    )

if [[ $# -lt 1 ]]; then
    echo "Usage: $( basename $0 ) <image-tag>"
    exit 1
fi

if [[ $1 = "main" || $1 = "test"  ]]; then
    echo "Dont delete $1 you pleb"
    exit 1
fi

for repo in ${array[@]}
do
    echo "Deleting tag: ${BLUE}$1${NC} for ${LIGHT_BLUE}$repo${NC}"
    aws --no-verify ecr batch-delete-image --repository-name $repo --image-ids imageTag=$1 | jq
done