#!/usr/bin/bash
remoteBranchCount=`git branch -r | wc -l`
localBranchCount=`git branch | wc -l`

echo "Remote branches count =>" $remoteBranchCount
echo "Local Branches Count =>" $localBranchCount

echo "Remote branches list:"
for branch in `git branch -r | perl -pe s/^..// | grep -v HEAD`; do
  echo `git show --format="%ci %cr %an" $branch | head -n 1` \\t$branch; 
done | sort -r
