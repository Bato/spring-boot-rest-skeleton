# Gitflow Workflow

## Branch structure of the project

The central repo holds two main branches with an infinite lifetime:
  master
  develop

## Historical Branches

Instead of a single master branch, this workflow uses two branches to record 
the history of the project. The master branch stores the official release history, 
and the develop branch serves as an integration branch for features. 
It's also convenient to tag all commits in the master branch with a version number.

## Feature Branches

Each new feature should reside in its own branch, which can be pushed to the central repository 
for backup/collaboration. But, instead of branching off of master, feature branches use 
develop as their parent branch. When a feature is complete, it gets merged back into develop. 
Features should never interact directly with master.

Note that feature branches combined with the develop branch is, for all intents and purposes, t
he Feature Branch Workflow.

## Release Branches

Once develop has acquired enough features for a release (or a predetermined release 
date is approaching), you fork a release branch off of develop. Creating this branch 
starts the next release cycle, so no new features can be added after this point—only 
bug fixes, documentation generation, and other release-oriented tasks should go in 
this branch. Once it's ready to ship, the release gets merged into master and tagged 
with a version number. In addition, it should be merged back into develop, which may 
have progressed since the release was initiated.

See also:
https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow  
http://nvie.com/posts/a-successful-git-branching-model/  

# Example

Create a develop branch
create an empty develop branch locally and push it to the server:

```sh
git branch develop
git push -u origin develop
```

Other developers should now clone the central repository and 
create a tracking branch for develop:

```sh
git clone git clone https://github.com/Bato/spring-boot-rest-skeleton.git
git checkout -b develop origin/develop
```

Begin new features

Create separate branches for all features. 
Instead of basing it on master, base all feature branches on develop:

```sh
git checkout -b some-feature develop
git status
git add <some-file>
git commit
```

Merge her feature into develop

```sh
git pull origin develop
git checkout develop
git merge some-feature
git push
git branch -d some-feature
```

prepare a release

```sh
git checkout -b release-0.1 develop
```

finishes the release

```sh
git checkout master
git merge release-0.1
git push
git checkout develop
git merge release-0.1
git push
git branch -d release-0.1

git tag -a 0.1 -m "Initial public release" master
git push --tags
```


End-user discovers a bug

To address the bug,  creates a maintenance branch off of master, 
fixes the issue with as many commits as necessary, 
then merges it directly back into master.
s
```sh
git checkout -b issue-#001 master
# Fix the bug
git checkout master
git merge issue-#001
git push
```

maintenance branches contain important updates that need to be included in develop

```sh
git checkout develop
git merge issue-#001
git push
git branch -d issue-#001
```

```sh
```

