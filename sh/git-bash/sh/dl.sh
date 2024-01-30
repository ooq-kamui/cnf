#!/bin/bash

# dl-dl.sh cre ( this dl sh )
# ```
# curl -Lo ~/sh/dl.sh \
#   https://raw.githubusercontent.com/ooq-kamui/vimrc/master/sh/git-bash/sh/dl.sh
# ```

# bk

mkdir -p ~/tmp

cp -p ~/.bashrc    ~/tmp/
cp -p ~/.vimrc     ~/tmp/
cp -p ~/.vimrc_win ~/tmp/


# bash

#curl -Lo ~/.bash_profile \
#  https://raw.githubusercontent.com/ooq-kamui/vimrc/master/sh/git-bash/.bash_profile

curl -Lo ~/.bashrc \
  https://raw.githubusercontent.com/ooq-kamui/vimrc/master/sh/git-bash/.bashrc

# vim

curl -Lo ~/.vimrc \
  https://raw.githubusercontent.com/ooq-kamui/vimrc/master/.vimrc

curl -Lo ~/.vimrc_win \
  https://raw.githubusercontent.com/ooq-kamui/vimrc/master/sh/git-bash/.vimrc_win


# cmd

# curl -Lo ~/sh/cmd/xx \
#   https://raw.githubusercontent.com/ooq-kamui/vimrc/master/sh/git-bash/sh/cmd/xx



