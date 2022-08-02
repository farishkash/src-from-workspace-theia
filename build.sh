#!/usr/bin/env bash

source args.sh
repo=github.com/cloudacademy/lab-webapi-event-content-image
tag=$(basename $repo)
# Set to unique value to force cloning if previous version of code is cached
docker build --build-arg ghuser=$ghuser \
             --build-arg pat=$pat \
             --build-arg repo=$repo \
             --build-arg forceclone=false \
             -t jsbin:$tag .
echo "Push with (after ECR docker login)
docker tag jsbin:$tag 421805900968.dkr.ecr.us-east-2.amazonaws.com/cloudacademy/labs-workspace/jsbin:$tag
docker push 421805900968.dkr.ecr.us-east-2.amazonaws.com/cloudacademy/labs-workspace/jsbin:$tag"

# Uncomment to auto tag+push
#docker tag jsbin:$tag 421805900968.dkr.ecr.us-east-2.amazonaws.com/cloudacademy/labs-workspace/jsbin:$tag
#docker push 421805900968.dkr.ecr.us-east-2.amazonaws.com/cloudacademy/labs-workspace/jsbin:$tag

echo "Set lab workspace image to the following when ready
421805900968.dkr.ecr.us-east-2.amazonaws.com/cloudacademy/labs-workspace/jsbin:$tag"