#!/usr/bin/env bash
if [ $# != 2 ]; then
  echo "Need exactly two arguments: fragment, and output file"
  exit 1
fi
if [ -z "${CMSSW_BASE}" ]; then
  echo "Need to set up a CMSSW release first"
  exit 1
fi
fragment="Configuration/NanoGenScripts/python/${1}"
echo "The path to the gridpack should be in the fragment: ${fragment} or changed through customise commands"
output=$(realpath "${2}")
startdir=$(pwd)
tmpdir=$(mktemp -d)
pushd "${tmpdir}"
nEvents=1000

cmsDriver.py "${fragment}" --fileout "file:${output}" --mc --eventcontent NANOAODSIM --datatier NANOAOD --conditions auto:mc --step LHE,GEN,NANOGEN -n "${nEvents}"

popd
if [ -d "${tmpdir}" ]; then
  rm -rf "${tmpdir}"
fi
