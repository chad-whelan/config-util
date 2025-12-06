
# Update the repo
git fetch

# List all the branches with the upstream branch | find the brnaches that are gone | don't get the current branch | print the branch name | into the delete branch cmd
git branch -vv | grep ': gone]' | grep -v '\*' | awk '{ print $1; }' | xargs git branch -d

