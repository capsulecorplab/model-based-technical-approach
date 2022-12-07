#!/usr/bin/bash

clitool="linkml-validate"
cmdargs="-s technical-approach-metamodel.yaml technical-approach-model.yaml"
cmd="$clitool $cmdargs"
dockercmd="docker run --rm -v $PWD:/work -w /work linkml/linkml:1.3.14 $cmd || true"
condition="$clitool --help | grep 'Show this message and exit.' > /dev/null"
dest="dist/linter-results.md"

if ! eval $condition; then
    eval $(echo $dockercmd)
else
    eval $cmd
fi
