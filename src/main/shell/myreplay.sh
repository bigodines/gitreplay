#!/usr/bin/env bash

# myreplay is the user configuration file (so to speak). You should
# define a function that will take the ref that is being updated as a
# result of `git push'. You are responsible for checking whether or
# not that branch should be replicated to svn and invoking replay_XXX
# functions.
#
# Following an example that depends on environment variables
# remote_root and local_root:
function myreplay_map
{
  local ref=${1}

  if [ "${ref}" = "refs/heads/master" ]
  then
    replay_strict replay_push "file:///${remote_root}" ${local_root} "master" "svn/trunk"
  elif [ "${ref}" = "refs/heads/devel" ]
  then
    replay_strict replay_push "file:///${remote_root}" ${local_root} "devel" "svn/devel"
  fi
}

source replay.sh
replay_run "myreplay_map"
