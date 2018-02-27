#!/bin/bash

# go to dir
cd $HOME/labbook_core/

# read config
. ./labbook.config

cp -n Makefile $dir/Makefile

# get date
year=`date +%Y`
month_no=`date +%m`
date=`date +%Y%m%d`
date_str=`date +'%B %d, %Y'`

filename=$dir$year/$month_no/$date.md


# if the file doesn't exist, do lots of set up
if [[ ! -f $filename ]]; then

# make file
mkdir -p $dir$year/$month_no/
touch $filename

# add header
echo "---
title: "$title"
author: "$author"
date: "$date_str"
---

[Home]($dir/index.html)

---" > $filename

# add file to md list of files
if [[ ! -f file_list.md ]]; then
  touch file_list.md
fi
echo -e "\n[$date_str]($filename)\n\n$(cat file_list.md)" > file_list.md


# put a header on that list and send it to the working directory
echo -e "---
title: "$title"
author: "$author"
---\n\n---\n\n$(cat file_list.md)" > $dir/index.md

fi

# drop me in
vim '-c :Goyo' $filename

# upon leaving make everything

cd $dir
make

