#!/bin/bash

if [[ $# -lt 2 ]]; then
    echo "Usage: $( basename $0 ) <repository-name> <image-tag>"
    exit 1
fi

if [[ $2 = "main" || $2 = "test"  ]]; then
    echo "Dont delete $2 you pleb"
    exit 1
fi

aws --no-verify ecr batch-delete-image --repository-name $1 --image-ids imageTag=$2 | jq