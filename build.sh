#!/bin/bash


# podman build -f Containerfile -t pycaptest --format docker .
# podman build -f slim.docker -t pycaptest2 --format docker .
# podman build -f sysnice.docker -t pycaptest3 --format docker .


for line in $(find . -type d | grep -v .git)
do
  tag="captest/$(echo $line | cut --characters=3-)"
  echo "TAG: $tag"
  pushd $line
    podman build -f Containerfile -t $tag --format docker .
  popd
done

