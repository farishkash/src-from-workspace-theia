#!/usr/bin/env bash

source args.sh
repo=github.com/cloudacademy/express-test-content-image
tag=$(basename $repo)
# Set to unique value to force cloning if previous version of code is cached
docker build --build-arg ghuser=$ghuser \
             --build-arg pat=$pat \
             --build-arg repo=$repo \
             --build-arg forceclone=false \
             -f Dockerfile.theia \
             --no-cache \
             -t theia:$tag .
echo "Push with (after ECR docker login)
docker tag theia:$tag 421805900968.dkr.ecr.us-east-2.amazonaws.com/cloudacademy/labs-workspace/theia:$tag
docker push 421805900968.dkr.ecr.us-east-2.amazonaws.com/cloudacademy/labs-workspace/theia:$tag"

# Uncomment to auto tag+push
#docker tag theia:$tag 421805900968.dkr.ecr.us-east-2.amazonaws.com/cloudacademy/labs-workspace/theia:$tag
#docker push 421805900968.dkr.ecr.us-east-2.amazonaws.com/cloudacademy/labs-workspace/theia:$tag

echo "Set lab workspace image to the following when ready
421805900968.dkr.ecr.us-east-2.amazonaws.com/cloudacademy/labs-workspace/theia:$tag"