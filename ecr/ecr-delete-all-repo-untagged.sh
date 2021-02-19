#!/bin/bash


RED='\033[0;31m'
LIGHT_BLUE='\033[1;34m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

array=(
    my-api
    my-ui 
    )

for i in ${array[@]}
do
    echo "Deleting tag: ${BLUE}UNTAGGED${NC} for ${LIGHT_BLUE}$i${NC}"
    IMAGES_TO_DELETE=$( aws --no-verify ecr list-images --repository-name $i --filter "tagStatus=UNTAGGED" --query 'imageIds[*]' --output json )
    aws --no-verify ecr batch-delete-image --repository-name $i --image-ids "$IMAGES_TO_DELETE" | jq
done