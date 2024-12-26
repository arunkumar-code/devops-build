#!/bin/bash
echo "running"
if [[ $GIT_BRANCH == "origin/dev" ]]; then
    # Build your project
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u arun05docker -p dckr_pat_KJmqw8P99rDytytfrgDCg96OC8E
    docker tag test arun05docker/dev
    docker push arun05docker/dev

elif [[ $GIT_BRANCH == "origin/main" ]]; then
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u arun05docker -p dckr_pat_KJmqw8P99rDytytfrgDCg96OC8E
    docker tag test arun05docker/prod 
    docker push arun05docker/prod
fi
