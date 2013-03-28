#!/usr/bin/env bash

cd $(dirname $0)

for file in $(ls -1d \.??* | grep -ve '^.git.*'); do

   if [ -L ~/$file ]; then
      echo $file is a link ... nothing to do
   elif [ ! -e ~/$file ]; then
      echo ~/$file does not exist ... linking
      ln -s $PWD/$file ~/$file

   elif [ -d ~/$file -o -f $file ]; then
      echo ~/$file is dir or file ... backup and linking
      mv ~/$file ~/${file}.bak
      ln -s $PWD/$file ~/$file
   else
      echo nothing to do for $file
   fi
done

for file in $(ls -1d \.?*.template); do
   target=$(echo $file | sed -e 's/\.template//')
   if [ ! -e ~/$target ]; then
       echo ~/target does not exist ... copying
       cp $file ~/$target
   fi
done

mkdir ~/.vim_undo 2>/dev/null



